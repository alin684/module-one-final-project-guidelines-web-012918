class Lyric < ActiveRecord::Base
  belongs_to: :songs
  has_many: :favorites, through: :songs






end
