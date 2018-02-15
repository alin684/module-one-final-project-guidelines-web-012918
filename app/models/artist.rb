class Artist < ActiveRecord::Base
  has_many :songs
  has_many :favorites, through: :songs
  has_many :users, through: :favorites

  def self.check_artist(user_input)
    existing_artists = Artist.all.map {|artist| artist.name}
    existing_artists.include?(user_input)
  end

  def self.find_artist_name(user_input)
    existing_artist = Artist.all.select do |artist|
      artist.name == user_input
    end
    existing_artist[0]
  end
end
