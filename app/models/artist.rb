class Artist < ActiveRecord::Base
  has_many :songs
  has_many :favorites,through: :songs

  def self.check_artist(user_input)
    existing_artists = Artist.all.map do |artist| artist.name
    end
    existing_artists.include?(user_input)
  end

  def self.check_artist_name(user_input)
    existing_artist = Artist.all.select do |artist|
      artist.name == user_input
      end
      existing_artist[0]
  end

end
