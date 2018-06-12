class MapController < ApplicationController
  before_action :authenticate_user!, only: [:created]

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, :notice => 'Tu dois être connecté pour accéder à cette page ;) '
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

  def index
  end

  def list
    @places = Place.all

  end

  def index
  end

  def explore
    north_lat = params[:"Nlat"].to_f
    north_long = params[:"Nlong"].to_f
    south_lat = params[:"Slat"].to_f
    south_long = params[:"Slong"].to_f
    # latitude = 100 / 111.111
    # longitude =  100 / (lat * Math.cos(lat))
    @a = Place.where("latitude <= #{north_lat} AND latitude >= #{south_lat} AND longitude <= #{south_long} AND longitude >= #{north_long}")
    render json: {rendu: @a}
  end
  
def find_place
  @a = Place.find(params[:"id"])
  redirect_to "/:#{@a.latitude}&#{@a.longitude}"
end
end
