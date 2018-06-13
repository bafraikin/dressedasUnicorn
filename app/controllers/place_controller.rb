class PlaceController < ApplicationController

  def add_imhere
    lat = params[:"lati"]
    lng = params[:"long"]
    @a = Geocoder.search([lat,lng])[0].address
    render json: {rendu: @a}
  end

  def add_geoloc
    lat = params[:"lati"]
    lng = params[:"long"]
    current_user.place_createds << Place.create(latitude: lat, longitude: lng, address: Geocoder.search([lat,lng])[0].address)
    @a = current_user.place_createds.last
    render json: {rendu: @a}
  end

  def find_with_address
    @a = Geocoder.coordinates(params[:"address"])
    sleep 0.2
    @b = Place.new(latitude: @a[0], longitude: @a[1])
    render json: {rendu: @b}
  end

  def put_address
    tag = params[:"tag"].split(',')
    lat = params[:"lati"]
    lng = params[:"long"]
    current_user.place_createds << Place.create(latitude: lat, longitude: lng, address: Geocoder.search([lat,lng])[0].address, name: params[:"nom"], description: params["description"])

    tag.each do | id |
      current_user.place_createds.last.tags << Tag.find(id)
    end

    @a = current_user.place_createds.last
    render json: {put: @a}
  end


  def update
   @place = Place.find(params[:id])
      if @place.update(place_params)
        redirect_to place_path(@place)
      else redirect_to place_path(@place)
        flash[:alert] = "La boutique n''a pas été mise à jour ! "
      end
end


  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to '/created'
    flash[:notice] = "Boutique supprimée !"
  end

  def favplaces
    placee = Place.find(params[:id])
    usera = User.find(params[:iduser])
    unless usera.liked_places.where(id: placee.id) == []
      FavPlace.where("liker_id == #{usera.id} AND place_id == #{placee.id}")[0].destroy
    else
      usera.liked_places << placee 
    end
  end

private

  def place_params
    params.require(:place).permit(:name, :longitude, :latitude, :address, :average_price, :description, :map, :town, :creator,
                                  :tag_to_places_count)
  end
end
