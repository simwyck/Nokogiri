# Route de la mairie 2

# On appelle les bibliothèques
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

# méthode get_all_the_urls_of_val_doise_townhalls qui, comme son nom l'indique, récupère toutes les url de villes du Val d'Oise.

def get_all_the_urls_of_val_doise_townhalls
  #binding.pry
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  doc.xpath('//td//a').each do |link|
    # Permet de récupérer les URLs uniquement
    puts link['href']
  end
end

get_all_the_urls_of_val_doise_townhalls()
