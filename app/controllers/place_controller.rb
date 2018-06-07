class PlaceController < ApplicationController
  before_action :authenticate_user!

  def add_geoloc
    lat = params[:"lati"]
    lng = params[:"long"]

    @a = Place.create(latitude: lat, longitude: lng)
    render json: {rendu: @a}
  end

  def find_with_address
    @a = Geocoder.coordinates(params[:"address"])
    sleep 0.2
    @b = Place.new(latitude: @a[0], longitude: @a[1])
    render json: {rendu: @b}
  end

  def put_address
    @a= Place.create(latitude: params[:"lati"], longitude: params[:"long"], address: params[:"address"], name: params[:"nom"])
 
 render json: {put: @a}
  end
end
