class PlaceController < ApplicationController

  def add_geoloc
    lat = params[:"lati"]
    lng = params[:"long"]
    current_user.places << Place.new(latitude: lat, longitude: lng, address: Geocoder.search([lat,lng])[0].address)
    @a = current_user.places.last
    render json: {rendu: @a}
  end

  def find_with_address
    @a = Geocoder.coordinates(params[:"address"])
    sleep 0.2
    @b = Place.new(latitude: @a[0], longitude: @a[1])
    render json: {rendu: @b}
  end

  def put_address
    lat = params[:"lati"]
    lng = params[:"long"]
    current_user.places << Place.new(latitude: lat, longitude: lng, address: Geocoder.search([lat,lng])[0].address, name: params[:"nom"])
    @a = current_user.places.last
 render json: {put: @a}
  end
end
