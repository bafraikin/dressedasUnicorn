class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :fav_places, foreign_key: 'liker_id'
  has_many :liked_places, through: :fav_places, source: :place
  has_many :place_creators, foreign_key: 'creator_id'
  has_many :place_createds, through: :place_creators, source: :place
  has_one_attached :avatar


# Cette méthode envoie un mail à l'admin lorsqu'un utilisateur a été créé
  
  after_create :new_user_created_mail
  after_destroy :user_deleted_mail



validates :username, presence: { message: "veuillez entrer votre prénom" }, format: { without: /\s/, message: "ton prénom ne peut pas contenir d'espace" }, uniqueness: { message: "ce pseudo est déjà pris" }
validates :avatar, presence: { message: "Veuillez ajouter un avatar" }



  def new_user_created_mail
    UserMailer.new_user_email(self).deliver
  end
# Lorsqu'un user supprime son compte
  def user_deleted_mail
    UserMailer.deleted_user_email(self).deliver
  end
 
  
end

