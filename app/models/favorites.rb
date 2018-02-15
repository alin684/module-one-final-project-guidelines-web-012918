class Favorites < ActiveRecord::Base
  belongs_to :users
  belongs_to :songs
  # has_many :artists, through: :songs
  # has_many :lyrics, through: :songs

  def self.save_song_to_favorites(songid, userid)
    self.create(song_id: songid, user_id: userid)
  end
end
