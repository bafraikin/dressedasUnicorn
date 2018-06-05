require 'rails_helper'

RSpec.describe PlaceController, type: :controller do

  describe "GET #add_geoloc" do
    it "returns http success" do
      get :add_geoloc
      expect(response).to have_http_status(:success)
    end
  end

end
