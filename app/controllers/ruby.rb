    user = [48.866667, 2.333333]
    tab = [1,2,5]
    longueur = []
    places = [[]]
    index = 0
    tab.each do |tag|
      tags = Tag.find(tag)
      tags.places.each do |place|
        calcul = Geocoder::Calculations.distance_between([user[0], user[1]], [place.latitude, place.longitude])
        unless longueur.include?(calcul)
          longueur[index] = calcul
          places[index] = []
          places[index][0] = place
          places[index][1] = place.tags
          places[index][2] = calcul
          index +=1
        end
      end
    end
    @a = places.sort! {| a, b |  a[2] <=> b[2] }


  places.each do |  place |
    puts place[0].name.to_s + "name"
    place[1].each do |tag |
      print tag.name + " "
  end
    print "\n"
    print place[2] 
    print "\n"
end
