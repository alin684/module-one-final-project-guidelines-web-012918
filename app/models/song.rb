class Song < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites
  has_one :lyric
  belongs_to :artist

  def self.check_song(api_song_name)
    existing_songs = self.all.map {|song| song.name}
    existing_songs.include?(api_song_name)
  end

  def self.find_song_name(api_song_name)
    existing_song = self.all.select do |song|
      song.name == api_song_name
      end
      existing_song[0]
  end

  def self.create_new_song(artist_name, song_name)
    if Artist.check_artist(artist_name) == true
      new_song = self.create(name: "#{song_name}")
      found_artist = Artist.find_artist_name(artist_name)
      new_song.update(artist: found_artist)
      new_song
    else
      # if artist DOES NOT exist, create new Artist Object
      # new_artist = Artist.create(name: "#{artist_name}")
      # artist_id = new_artist.id
      # new_song = self.create(name: "#{song_name}", artist_id: artist_id)
      new_song = self.create(name: "#{song_name}")
      new_artist = Artist.create(name: "#{artist_name}")
      new_song.update(artist: new_artist)
      new_song
    end
  end
end
