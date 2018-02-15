class User < ActiveRecord::Base
  has_many :favorites
  has_many :songs, through: :favorites
  has_many :artists, through: :songs
  has_many :lyrics, through: :songs

  def self.check_user(user_input)
    existing_users = User.all.map {|user| user.name}
    existing_users.include?(user_input)
    # true if username exists, false if not
  end

  def check_and_save(artist_name, song_name, lyrics)
    if Song.check_song(song_name) == true
      found_song = Song.find_song_name(song_name)
      Favorites.save_song_to_favorites(found_song.id, self.id)
    else
      new_song_with_artist = Song.create_new_song(artist_name, song_name)
      new_lyrics = Lyric.create(lyrics: "#{lyrics}")
      new_song_with_artist.update(lyric: new_lyrics)
      # new_song_with_artist.lyric = Lyric.create(lyrics: "#{lyrics}")
      # new_song_with_artist.save
      Favorites.save_song_to_favorites(new_song_with_artist.id, self.id)
    end
  end
end
