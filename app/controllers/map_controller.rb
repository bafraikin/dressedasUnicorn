require "pry"

class MapController < ApplicationController
  def index
    

  end

  def testons

    north_lat = params[:"Nlat"].to_f
    north_long = params[:"Nlong"].to_f
    south_lat = params[:"Slat"].to_f
    south_long = params[:"Slong"].to_f

    Place.create(longitude: north_long, latitude: north_lat)


   # latitude = 100 / 111.111 
   # longitude =  100 / (lat * Math.cos(lat))
  

    @a = Place.all
    Place.where("latitude <= #{north_lat} AND latitude >= #{south_lat} AND longitude >= #{south_long} AND longitude <= #{north_long}")
      render json: {caca: @a }
  end
end
