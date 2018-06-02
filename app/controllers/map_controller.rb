class MapController < ApplicationController
  def index
    puts params
  end

  def testons
    lat = params[:"lat"].to_f
    long = params[:"long"].to_f

    Place.create(longitude: long, latitude: lat)

    latitude = 100 / 111.111 
    longitude =  100 / (lat * Math.cos(lat))
    @a = Place.all
      Place.where("latitude <= #{latitude + lat} AND latitude >= #{lat - latitude} AND longitude >= #{long - longitude} AND longitude <= #{long + longitude}")

    render json: {caca: @a }
  end
end
