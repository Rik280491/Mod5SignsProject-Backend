class Sign < ApplicationRecord
  has_many :videos 
  belongs_to :user

end
