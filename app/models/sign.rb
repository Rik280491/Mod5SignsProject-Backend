class Sign < ApplicationRecord
  has_many :videos 
  has_many :users, through: :videos
  

  def serialise_details
    {
      id: self.id,
      name: self.name,
      videos: self.videos,
      users: self.users,
    }
  end
end
