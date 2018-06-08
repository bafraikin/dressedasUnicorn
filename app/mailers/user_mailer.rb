class UserMailer < ApplicationMailer
    default from: 'broussolle.paul@gmail.com'
 @mail_admin = 'urbemporium@gmail.com'

  def new_user_email(user)
    @user = user
    mail(:to => @mail_admin, :subject => "Nouvel utilisateur créé")
  end

  def deleted_user_email(user)
    @user = user
    mail(:to => @mail_admin, :subject => "Compte utilisateur détruit")
  end 
end
