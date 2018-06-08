class UserMailer < ApplicationMailer
    default from: 'broussolle.paul@gmail.com'
 

  def new_user_email(user)
    @user = user
    mail(:to => 'broussolle.paul@gmail.com', :subject => "Nouvel utilisateur créé")
  end

end
