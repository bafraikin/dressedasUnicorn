class MapController < ApplicationController
  def index
    puts params
  end

  def testons
    puts params[:"latlong"].to_f

    @a = Place.find([1,10]) 

    render json: {caca: @a }
  end
end
