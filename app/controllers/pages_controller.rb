require 'pry'

class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:admin, :destroy]

  def authenticate_user!
    if current_user.try(:admin?)
      super
    else
      redirect_to new_user_session_path, :alert => 'Tu dois être admin pour accéder à cette page ;) '
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

  def favoris

  end

  def category
    @tagz = Tag.all
    @places = Place.all
  end

  def list_by_tag
    user = params[:"user"].split(',')
    tab = params[:"tags"].split(',')
    longueur = []
    placee = []
    index = 0
    tab.each do |tag|
      tags = Tag.find(tag)
      tags.places.each do |place|
        calcul = Geocoder::Calculations.distance_between([user[0], user[1]], [place.latitude, place.longitude])
        unless longueur.include?(calcul)
          longueur[index] = calcul
          placee[index] = []
          placee[index][0] = place
          placee[index][1] = place.tags
          if user[0] != "false"
            placee[index][2] = calcul
          else
            placee[index][2] = false
            puts "ici"
          end
          if user_signed_in?
            placee[index][3] = current_user.id
          end
          index +=1
        end
      end
    end
    @a = placee.sort! {| a, b |  a[2] <=> b[2] }
    render json: {data: @a }
  end


  #Methode pour le dashboard admin qui récupère users et boutiques
  def admin
    @users = User.all
    @places = Place.all
    @creator = []
    @places.each_with_index do |place,index| 
      @creator[index] = place.creators[0].username
    end
  end

  def update_user
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Profil utilisateur mis à jour"
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect :back
  end

  #Fonction pour changer le rôle d'un user vers admin ou user normal. Impossible de changer l'admin avec mon adresse mail pour avoir au moins 1 admin
  def changeAdminRole
    user = User.find(params[:id])
    if user.admin == false
      user.update_attribute :admin, true      
      flash[:notice] = "Impossible de supprimer cet utilisateur"
    else
      if user.email == 'broussolle.paul@gmail.com'
        puts "Impossible de changer le rôle de cet admin"
      else
        user.update_attribute :admin, false
      end
    end
  end
end
