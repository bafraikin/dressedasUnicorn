require 'rails_helper'
require 'faker'
require 'geocoder'

RSpec.describe PlaceController, type: :controller do

  describe "GET #add_geoloc" do
    it "returns http success" do
      get :add_geoloc
      expect(response).to have_http_status(:success)
    end
  end

end


RSpec.describe PlaceController, type: :controller do

  it 'should generate the right address' do
    boutique = Place.new
    boutique.longitude = -0.118092
    boutique.latitude = 51.509865 
    boutique.save 
    expect(boutique.address).to eq('Waterloo Bridge, London, UK')
  end

end