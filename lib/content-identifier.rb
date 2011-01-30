require 'rubygems'
require 'nokogiri'
require 'readability'
require 'open-uri'
class ContentIdentifier

	def initialize(identifierType)
		requiredType = identifierType.capitalize
		returnType =  case requiredType
				when 'HEURISTIC' then HeuristicIdentifier.new 
			end
			return returnType
	end
end

class HeuristicIdentifier
	SearchElements = 'div, p, span, td, h1, h2, h3, h4, form, img, ul'
	
	attr_accessor :document
	
	def initialize(document, docName = 'UntitledDocument')
		@document = Nokogiri::HTML(document, nil, 'UTF-8')
		@elements = @document.css(SearchElements)
		@document_title = docName
		@elements.each do |e|
			#e[:parent_id] = ''
			#e[:parent_cl] = ''
			#f = e # f recurses through e's parents
			#while !f.nil? && SearchElements.include?(f.name.downcase)
				#e[:parent_id] += f.parent[:id] unless f.parent[:id].nil?
				#e[:parent_cl] += f.parent[:class] unless f.parent[:class].nil?
				#f  = f.parent
			#end
		end
	end
	
	def GetLogo
		#This is a heurstic identifier. We simply look at id and class name with decreasing specificity
		
		
		logo = (@elements.detect { |e| e.name.downcase == 'img' && e[:id]=~ /logo|masthead/i} or 		#id contains logo
			@elements.detect { |e| e.name.downcase == 'img' && e[:class]=~ /logo|masthead/i} or		#class name contains logo
			@elements.detect { |e| e.name.downcase == 'img' && e.parent[:id]=~ /logo|masthead/i} or 	#parent id contains logo
			@elements.detect { |e| e.name.downcase == 'img' && e.parent[:class]=~ /logo|masthead/i} or	#parent class contains logo
			@elements.detect { |e| e.name.downcase == 'img' && e.attr('src')=~ /logo|masthead/i} or	#parent class contains logo
			@elements.detect { |e| e.name.downcase == 'img' && e[:parent_id]=~ /logo|masthead/i} or 	#parent id contains logo
			@elements.detect { |e| e.name.downcase == 'img' && e[:parent_cl]=~ /logo|masthead/i} or	#parent class contains logo
			nil)
		print "logo: #{logo}\n"
		logo = logo.attr('src') if !logo.nil?
	end
	
	def GetSearch
		forms = @document.css('form')
		search_form = (forms.detect { |f| f[:action] =~/search/i} or
			forms.detect {|f| f[:id] =~ /search/i})
		
		search_form
	end
	
	
	def GetNav
		nav = @elements.css('div, span, ul, p').find_all {|e|
			((!e[:id].nil? && e[:id].downcase =~ /nav|mainmenu/)  || (!e[:class].nil? && e[:class].downcase =~ /nav|mainmenu/))
			}
			return nil if nav.empty?
			
			#Find the one with the most number of 'a' tags
			nav.sort {|a, b| 
				b.css('a').count <=> a.css('a').count
			}
			
			returnNav =nav.first
			nav.each {|e| 
				if e!= returnNav
					returnNav.add_child(e)
				end
			}
			returnNav
	end
	
	
	def TrainListOfLinks
		trainingFile = 'listofLinks.txt'
		candidates = @document.css('div, ul, dl')
		
		File.open(trainingFile,'a') do |file|
			file.write(Time.now.to_s + '\n')
			candidates.each do |c|
				length = c.text.length
				numLinks = c.css('a').length
				#collapse and find total length of text within an <a> tag
				linkLength = c.css('a').reduce(0) do |acc, e|
					acc + e.content.length
				end
				isDiv = c.name.downcase == 'div' ? 1 : 0
				isUl = c.name.downcase == 'ul' ? 1 : 0
				
				containsBox = c[:id] =~ /box/ || c[:class] =~ /box/ ? 1: 0
				containsSideBar = c[:id] =~ /side/ || c[:class] =~ /side/ ? 1: 0
				
				#Write to libsvm file, labels should be added manually
				file.write "0 1:#{length} 2:#{numLinks} 3:#{linkLength} 4:#{isDiv} 5:#{isUl} 6:#{containsBox} 7:#{containsSideBar} \##{c[:id] || c[:class] || c.content.strip[0..15]} #{@document_title} \n"
			end
		end
	end
	
	def GetListOfLinks
		candidates = @elements.css('div ul')
		link_list =candidates.find do |c|
				length = c.text.length
				numLinks = c.css('a').length
				#collapse and find total length of text within an <a> tag
				linkLength = c.css('a').reduce(0) do |acc, e|
					acc + e.content.length
				end
				next if length == 0 || numLinks == 0 || linkLength==0
				containsBox = c[:id] =~ /box/ || c[:class] =~ /box/ ? 1: 0
				containsSideBar = c[:id] =~ /side/ || c[:class] =~ /side/ ? 1: 0
				
				if numLinks > 2 && linkLength/length > 0.5 && linkLength/numLinks > 30
					true #we return, the rest should not matter
				elsif !c[:id].nil? && c[:id]=='featurettes' # testing only
					true
				else
					false
				end
			end
			link_list = @elements.css('#featurettes')
			link_list.css('img').each {|e| e[:class] = 'linkListImage'}
			link_list.css('a').each { |e| e[:class] = 'linkListLink'}
			link_list.css('p').each {|e| e[:class] = 'linkListDescription'}
			
			print "Link list: #{link_list}\n"
			link_list
	end
	
	def GetTitle
	  @document.css('title').text
	end
end
