# Route de la mairie 1

# On appelle les bibliothèques
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# méthode get_the_email_of_a_townhal_from_its_webpage qui, comme son nom l'indique, récupère l'adresse email à partir de l'url d'une mairie, par exemple celle de Vauréal

# Avec CSS
=begin
def get_the_email_of_a_townhal_from_its_webpage
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))
  # Avec CSS, je n'arrive pas à avoir uniquement l'email. Je récupère 5-6 autres infos également.
  page.css('html body table tr td table tr td table tr td table tr td.style27 p.Style22').each do |el|
     puts el.text
  end
end
=end

# Avec Xpath
def get_the_email_of_a_townhal_from_its_webpage
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
  # Ca fonctionne aussi si on enlève /html/body au début. Il faut aussi laisser les chiffres entre crochets.
  doc.xpath('/html/body/table/tr[3]/td/table/tr[1]/td[1]/table[4]/tr[2]/td/table/tr[4]/td[2]/p').each do |el|
    puts el.text
  end
end

get_the_email_of_a_townhal_from_its_webpage()
