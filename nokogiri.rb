require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = ('https://www.timeout.fr/paris/shopping/bourgine#tab_panel_2')

    def shop_list(url)
        page = Nokogiri::HTML(open(url))
        boutique = page.css('td')[0].text.gsub(" ", "").gsub(/\n/, "")
        adresse = page.css('td')[2].text.gsub(" ", "").gsub(/\n/, "")
        horaires = page.css('td')[3].text
        metro = page.css('td')[4].text.gsub("Métro :", "")
        page = Nokogiri::HTML(open(url))
        lien = page.css('td').css('a[href]')
        site = lien[0]["href"]
        fiche = Hash[:Boutique => boutique, :Adresse => adresse, :Horaires => horaires, :Site => site, :Métro => metro]
        puts fiche
end
file.open(fiche_boutique(url))