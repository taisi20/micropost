class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  
  #課題
  has_many :favorites
end
