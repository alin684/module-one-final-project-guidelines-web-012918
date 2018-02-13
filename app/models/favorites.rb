class Favorites < ActiveRecord::Base
  belongs_to: :users
  belongs_to: :songs
  has_many: :artists, through: :songs
  has_many: :lyrics, through: :songs




end
