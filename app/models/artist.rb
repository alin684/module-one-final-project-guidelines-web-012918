class Artist < ActiveRecord::Base
  has_many: :songs
  has_many: :favorites,through: :songs






end
