class Song < ActiveRecord::Base
  has_many: :users, through: :favorites
  has_many: :favorites
  has_one: :lyrics
  belongs_to: :artist




end
