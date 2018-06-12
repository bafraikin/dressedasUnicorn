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
  def created
  end

  def list
    @places = Place.all
  end

  def test
  end

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

  def changeAdminRole
   user = User.find(params[:id])
    if user.admin == false
      user.update_attribute :admin, true
    else
      if user.email == 'broussolle.paul@gmail.com'
      puts "Non lol"
      else
      user.update_attribute :admin, false
      end
    end

  end

 

  private
  def user_params
    params.require(:user).permit(:avatar)
  end
end
