require 'rails_helper'

RSpec.describe PlaceController, type: :controller do

  describe "GET #add_geoloc" do
    it "returns http success" do
      a = User.new
      a.place_createds << Place.new(latitude:  51.509865, longitude: -0.118092)
      expect(a.place_createds).not_to be_empty
    end
  end

end


RSpec.describe PlaceController, type: :controller do

  it 'should associate 2tags to a place' do
    user = User.new
    boutique = Place.new
    user.place_createds << boutique
    tag1 = Tag.create!
    tag2 = Tag.create!
    tag1.places << boutique
    tag2.places << boutique
    expect(boutique.tags).to include(tag1)
    expect(boutique.tags).to include(tag2)
    expect(tag1.places).to include(boutique)


  end
end
