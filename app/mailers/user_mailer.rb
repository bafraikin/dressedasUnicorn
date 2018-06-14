class UserMailer < ApplicationMailer
    default from: 'broussolle.paul@gmail.com'
 @mail_admin = 'urbemporium@gmail.com'

  def new_user_email(user)
    
    @user = user
    mail(:to => 'urbemporium@gmail.com', :subject => "Nouvel utilisateur créé")
  end

  def deleted_user_email(user)
    @user = user
    mail(:to => 'urbemporium@gmail.com', :subject => "Compte utilisateur détruit")
  end 

  def welcome
    @user = User.last
    @login  = 'https://urban-emporium.herokuapp.com/users/sign_in'
    @myshops = 'https://urban-emporium.herokuapp.com/created'
    mail(to: @user.email, subject: 'Bienvenue :D !')
  end
end
