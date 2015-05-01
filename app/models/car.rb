class Car < ActiveRecord::Base
  has_many :garages
  has_many :fans, through: :garages, source: :user
  belongs_to :owner, foreign_key: 'owner_id'

  include EPASearch
    
end
