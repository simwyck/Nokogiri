# Print out Wikipedia summary labels

require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/HTML'))

page.css('div#content div#bodyContent table.infobox tr th').each do |el|
   puts el.text
end
