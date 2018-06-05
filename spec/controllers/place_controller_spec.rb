require 'rails_helper'
require 'faker'

RSpec.describe PlaceController, type: :controller do

  describe "GET #add_geoloc" do
    it "returns http success" do
      get :add_geoloc
      expect(response).to have_http_status(:success)
    end
  end

end


RSpec.describe PlaceController, type: :controller do
  it 'should generate the right adress' do
    boutique = Place.new (name: '')
    boutique.Place.longitude << Place.longitude.new ('longitude' => Faker::Address.longitude)
    boutique.Place.latitude << Place.latitude.new (latitude: 'Faker::Address.latitude')
    boutique.save
   
    expect(Place.adress).to_eq()
    expect(Place.adress).to_include()
  end

end