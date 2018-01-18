# Select nested CSS elements

require 'rubygems'
require 'nokogiri'
#require 'restclient'

page = Nokogiri::HTML(open("hello-webpage.html"))

news_links = page.css("div#references a")
news_links.each{|link| puts "#{link.text}\t#{link['href']}"}
