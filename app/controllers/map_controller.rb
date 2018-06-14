class MapController < ApplicationController
  before_action :authenticate_user!, only: [:created]

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, :notice => 'Tu dois être connecté pour accéder à cette page ;) '
    end
  end

  def list
    @places = Place.all
  end

  def index
    @tagi = Tag.all
  end

  def explore
    north_lat = params[:"Nlat"].to_f
    north_long = params[:"Nlong"].to_f
    south_lat = params[:"Slat"].to_f
    south_long = params[:"Slong"].to_f
    # latitude = 100 / 111.111
    # longitude =  100 / (lat * Math.cos(lat))
    @a = []
    @a[0] = Place.where("latitude <= #{north_lat} AND latitude >= #{south_lat} AND longitude <= #{south_long} AND longitude >= #{north_long}")
    @a[1] = current_user.id
    @a[2] = current_user.liked_places
    render json: {rendu: @a}
  end

  def find_place
    @a = Place.find(params[:"id"])
    redirect_to "/:#{@a.latitude}&#{@a.longitude}"
  end
end
