class Lyric < ActiveRecord::Base
  belongs_to :songs
  has_many :favorites, through: :songs


  def display_lyrics(lyrics)
  puts "#{lyrics}"
  end




end
