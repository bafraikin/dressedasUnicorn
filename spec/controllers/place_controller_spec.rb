require 'rails_helper'

RSpec.describe PlaceController, type: :controller do

  describe "GET #add_geoloc" do
    it "returns http success" do
      user.new.places << Place.new(latitude:  51.509865, longitude: -0.118092, address: Geocoder.search([lat,lng])[0].address)
      get :add_geoloc
      expect(response).to have_http_status(:success)
    end
  end

end


RSpec.describe PlaceController, type: :controller do
  it 'should generate the right address' do
    user = User.new
    boutique = Place.new
    user.places << boutique
    boutique.latitude = 51.509865 
    boutique.longitude = -0.118092
    user.save
    boutique.save 
    expect(boutique.address).to eq('Waterloo Bridge, London, UK')
  end

  it 'should associate 2tags to a place' do
    user = User.new
    boutique = Place.new
    user.places << boutique
    cool = Tag.create!
    sympa = Tag.create!
    cool.places << boutique
    sympa.places << boutique
    user.save
    boutique.save
    expect(boutique.tags).to include(cool)
    expect(boutique.tags).to include(sympa)
  end
end