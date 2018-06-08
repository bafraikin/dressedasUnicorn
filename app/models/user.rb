class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :places, foreign_key: "creator_id"
# Ces méthodes envoient un mail à l'admin lorsqu'un utilisateur a été créé
      after_create :new_user_created_mail

      after_destroy :user_deleted_mail

  # A la création d'un user
  def new_user_created_mail
    UserMailer.new_user_email(self).deliver
  end
# Lorsqu'un user supprime son compte
  def user_deleted_mail
    UserMailer.deleted_user_email(self).deliver
  end
end
