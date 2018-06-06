class PlaceController < ApplicationController
  before_action :authenticate_user!

  def add_geoloc

    lat = params[:"lati"]
    lng = params[:"long"]

    @a = Place.create(latitude: lat, longitude: lng)
    render json: {rendu: @a}
  end
end
