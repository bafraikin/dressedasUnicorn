class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and 
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable, :confirmable

	# Allow to connect with omniauth-facebook
	#devise :omniauthable, omniauth_providers: => [:facebook]
	devise :omniauthable, omniauth_providers: %i[facebook]

  has_many :places, foreign_key: "creator_id"
  
	# Ces méthodes envoient un mail à l'admin lorsqu'un utilisateur a été créé
	after_create :new_user_created_mail

	after_destroy :user_deleted_mail




	validates :username, presence: { message: "veuillez entrer votre prénom" }, format: { without: /\s/, message: "ton prénom ne peut pas contenir d'espace" }, uniqueness: { message: "ce pseudo est déjà pris" }
  #validates :email, presence: { message: "veuillez entrer votre adresse email" }
  #validates :email, uniqueness: { message: "cette adresse est déjà prise" }
  #validates :password, presence: { message: "veuillez entre votre mot de passe" } 

	def new_user_created_mail
		UserMailer.new_user_email(self).deliver
  end
  
	# Lorsqu'un user supprime son compte
	def user_deleted_mail
		UserMailer.deleted_user_email(self).deliver
	end

	def self.from_omniauth(auth)
		where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
		  user.provider = auth.provider
		  user.uid = auth.uid
		  user.name = auth.info.name
		  user.oauth_token = auth.credentials.token
		  user.oauth_expires_at = Time.at(auth.credentials.expires_at)
		  user.save!
		end
	end

#	def self.from_omniauth(auth)
	# 	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	# 		user.email = auth.info.email
	# 		user.password = Devise.friendly_token[0,20]
	# 		user.username = auth.info.username # assuming the user model has a name
	# 		#user.image = auth.info.image      # assuming the user model has an image
	# 		# If you are using confirmable and the provider(s) you use validate emails, 
	# 		# uncomment the line below to skip the confirmation emails.
    #   		# user.skip_confirmation!
    #   		user.save!
	# 	end
	# end


	#  def self.from_facebook(auth)
	#    where(facebook_id: auth.uid).first_or_create do |user|
	#      user.email = auth.info.email
	#      user.username = auth.info.name 
	#      user.password = Devise.friendly_token[0, 20]
	#      #user.image = auth.info.image # assuming the user model has an image
	#      user.skip_confirmation!
	#    end
	#  end

end
