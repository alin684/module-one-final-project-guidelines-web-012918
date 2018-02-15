class User < ActiveRecord::Base
  has_many :songs, through: :favorites
  # has_many :lyrics, through: :songs
  has_many :favorites

  def self.check_user(user_input)
    existing_users = User.all.map do |user| user.name
    end
    existing_users.include?(user_input)
  end

  def check_and_save(artist_name, song_name, lyrics)
    if Song.check_song(song_name) == true
      found_song = Song.check_song_name(song_name)

      Favorites.save_song_to_favorites(found_song.id, self.id)
    else
      new_song = Song.create_new_song(song_name, artist_name)
      # new_lyrics = Lyric.create(lyrics: "#{lyrics}")
      # new_song.lyrics = new_lyrics
      # binding.pry

      Favorites.save_song_to_favorites(new_song.id, self.id)
    end
  end
end
