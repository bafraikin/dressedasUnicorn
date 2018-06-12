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
    lat = params[:"lati"]
    lng = params[:"long"]
    current_user.place_createds << Place.create(latitude: lat, longitude: lng, address: Geocoder.search([lat,lng])[0].address, name: params[:"nom"], description: params["description"])
    @a = current_user.place_createds.last
    render json: {put: @a}
  end

  def new
    @place = Place.new
  end

  def created
    @place = Place.new(place_params)
    @place.save
  end

  def show
    @place = Place.find(params[:id])
  end


  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      redirect_to place_path(@place)
    else redirect_to place_path(@place)
      flash[:error] = "La boutique n''a pas été mise à jour ! "
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to '/created'
    flash[:notice] = "Boutique supprimée !"
  end

  private

  def place_params
    params.require(:place).permit(:name, :longitude, :latitude, :address, :average_price, :description, :map, :town, :creator,
                                  :tag_to_places_count)
  end
end
