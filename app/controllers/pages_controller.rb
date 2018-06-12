class PagesController < ApplicationController
    before_action :authenticate_user!, only: [:admin, :destroy]

    def authenticate_user!
        if current_user.try(:admin?)
          super
        else
          redirect_to new_user_session_path, :notice => 'Tu dois être admin pour accéder à cette page ;) '
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
  end

  def update_user
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile utilisateur mis à jour"
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
  end

  def change_admin_role
    
  end

end
