class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :places, foreign_key: "creator_id"
# Ces méthodes envoient un mail à l'admin lorsqu'un utilisateur a été créé
      after_create :new_user_created_mail

      after_destroy :user_deleted_mail

  


validates :username, presence: { message: "veuillez entrer votre prénom" }, format: { without: /\s/, message: "ton prénom ne peut pas contenir d'espace" }, uniqueness: { message: "ce pseudo est déjà pris" }
=begin
  validates :email, presence: { message: "veuillez entrer votre adresse email" }
  validates :email, uniqueness: { message: "cette adresse est déjà prise" }
  validates :password, presence: { message: "veuillez entre votre mot de passe" }
=end 

  def new_user_created_mail
    UserMailer.new_user_email(self).deliver
  end
# Lorsqu'un user supprime son compte
  def user_deleted_mail
    UserMailer.deleted_user_email(self).deliver
  end
end

