class Video < ApplicationRecord
  belongs_to :sign
  belongs_to :user
end
