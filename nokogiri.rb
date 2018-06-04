require 'rubygems'
require 'nokogiri'
require 'open-uri'


 url = "https://www.timeout.fr/paris/shopping/"

def get_shop_name(url)

page = Nokogiri::HTML(open(url))
name = page.xpath('/html/body/div[2]/main/article/header/div/div[1]/h1').text


end
get_shop_name(url)


def get_shop_address(url)

h={}
page = Nokogiri::HTML(open(url))
address = page.xpath('/html/body/div[2]/main/article/div/section/section/div[5]/table/tbody/tr[3]/td').text


address = "Adresse: " + address

    # Pour récupérer les infos de timeOut
end

get_shop_name(url)
get_shop_address(url)

=begin
address = page.css('td:contains("Paris")').text
shopz = Hash[name => address] 
def get_links(lien)

    page = Nokogiri::HTML(open(lien))

    list_url = page.css('a.lientxt')
    array_links = []

    list_url.each { |link| 
        url = link['href'] 
        array_links.push(url)
        # Pour récupérer les urls de chaque mairie depuis la page de l'annuaire
    }
    array_links.each { |href|
        complete_link = URI.join(lien,href).to_s
        # Utilisation de URI pour avoir un lien complet et propre de chaque mairie
        get_email(complete_link)
        # Appel à la méthode précédente de récupération des emails et villes sur les liens scrappés
    }   
end

def perform
    lien = "http://annuaire-des-mairies.com/val-d-oise.html"
    get_links(lien)
end

perform
=end

