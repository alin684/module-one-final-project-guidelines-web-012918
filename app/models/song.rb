class Song < ActiveRecord::Base
  has_many :users, through: :favorites
  has_many :favorites
  has_one :lyrics
  belongs_to :artist


  def self.check_song(user_input)
    existing_songs = self.all.map do |song| song.name
    end
    existing_songs.include?(user_input)
  end

  def self.check_song_name(user_input)
    existing_song = self.all.select do |song|
      song.name == user_input
      end
      existing_song[0]
  end

  def self.create_new_song(artist_name, song_name)
    if Artist.check_artist(artist_name) == false
      # if artist DOES NOT exist, create new Artist Object
      new_artist = Artist.create(name: "#{artist_name}")
      artist_id = new_artist.id
      new_song = self.create(name: "#{song_name}", artist_id: artist_id)
      # binding.pry
      new_song
    else
      new_song = self.create(name: "#{song_name}")
      new_song.artist = Artist.check_artist_name(artist_name)
      new_song
    end
  end
end
