class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :garages
  has_many :favorite_cars, through: :garages
  has_many :owned_cars, through: :cars, foreign_key: 'owner_id'
end
