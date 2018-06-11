class PagesController < ApplicationController
    before_action :authenticate_user!, only: [:admin]

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

end
