class Lyric < ActiveRecord::Base
  belongs_to :song
  has_many :favorites, through: :songs
  has_many :users, through: :songs

  def display_lyrics
    puts "#{self}"
  end
end
