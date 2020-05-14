class User < ApplicationRecord
    has_many :videos
    has_many :signs, through: :videos
    has_secure_password

end
