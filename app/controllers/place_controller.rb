class PlaceController < ApplicationController
  def add_geoloc

    lat = params[:"lati"]
    lng = params[:"long"]

    @a = Place.create(latitude: lat, longitude: lng)
    render json: {rendu: @a}
  end
end
