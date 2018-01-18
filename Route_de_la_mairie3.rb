# Route de la mairie 3

# On appelle les bibliothèques
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

# recoller les méthodes ensemble

# On enregistre l'URL racine du site
@base_url = "http://annuaire-des-mairies.com/"

# Scraper URLs
def get_all_the_urls_of_val_doise_townhalls(@url_valdoise)
  doc = Nokogiri::HTML(open(@url_valdoise))
  doc.xpath('//td//a').each do |link|
    @link_href = link['href']
    @urls_townhalls = @base_url + @link_href[2..-1]
    puts @urls_townhalls
  end
end

get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")

# Scraper email
def get_the_email_of_a_townhall_from_its_webpage(@url_townhall)
  binding.pry
  doc = Nokogiri::HTML(open(@url_townhall))
  doc.xpath('/html/body/table/tr[3]/td/table/tr[1]/td[1]/table[4]/tr[2]/td/table/tr[4]/td[2]/p').each do |el|
    puts el.text
  end
end

get_the_email_of_a_townhall_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")

def get_all_emails
  all_emails = []
  get_all_the_urls_of_val_doise_townhalls.each { |url| page_Email_ville.push @urls_townhalls }
end

# Code Arnold: https://github.com/Arnolddomaya/parsing_ruby/blob/master/projet_parsing/route_mairie.rb
def perform()
  res = []
  get_all_the_urls_of_val_doise_townhalls().each do |mairie_url|
    nom = mairie_url.text
    email = get_the_email_of_a_townhal_from_its_webpage(mairie_url["href"])
    #puts "nom : #{nom}  email: #{email}"
    res << {:name =>nom , :email=>email }
  end
  res
end

=begin
def perform
  #binding.pry
  puts get_the_email_of_a_townhal_from_its_webpage(get_the_email_of_a_townhal_from_its_webpage)
end

perform
=end
