require_relative '../config/environment.rb'
require_relative '../app/models/user.rb'
require_relative '../app/models/artist.rb'
require_relative '../app/models/favorites.rb'
require_relative '../app/models/lyric.rb'
require_relative '../app/models/song.rb'

require 'rest-client'
require 'JSON'
require 'pry'
require 'magic_cloud'
require 'launchy'

def user_artist_request
  puts "What artist are you looking for?"
  user_artist_input = gets.chomp
  user_artist_input
end

def user_song_request
  puts "What song are you looking for?"
  user_song_input = gets.chomp
  user_song_input
end

def api_call_response(user_artist_input, user_song_input)
  artist_input = "#{user_artist_input}"
  url_artist_input = artist_input.downcase.gsub(/[^a-zA-Z\s.]/,"").gsub(".", "").gsub(" ", "%20")
  song_input = "#{user_song_input}"
  url_song_input = song_input.downcase.gsub(/[^a-zA-Z\s.]/,"").gsub(".", "").gsub(" ", "%20")
  begin
    api_call_response = RestClient.get("https://orion.apiseeds.com/api/music/lyric/#{url_artist_input}/#{url_song_input}?apikey=HQFSeDG9ANwvtoJgF4rUgai2RlVw7JI6Q6nrjUGCk8JSLSpfJYYwNhkV3o0bFyor")
    rescue
      puts "No song and artist found - please try again."
      get_hash_using_song_and_artist
    else
      #Successful match found
    song_data = JSON.parse(api_call_response)
  end
  song_data
  # HASH of song info
end

def get_hash_using_song_and_artist
  user_artist = user_artist_request
  user_song = user_song_request
  api_call_response(user_artist, user_song)
end

def artist_grabber(song_hash)
  song_hash['result']['artist']['name']
end

def song_grabber(song_hash)
   song_hash['result']['track']['name']
end

def lyric_grabber(song_hash)
  song_hash['result']['track']['text']
end

def exit_app
   abort("fuck outta here")
end

def lyric_options
  puts "What would you like to see?"
  puts "(1) Lyrics."
  puts "(2) Word cloud."
  puts "(3) The top 10 most common words in this song (minus stop words)."
  puts "(4) The number of unique words in this song (minus stop words)."
  puts "(5) The total number of words in this song."
  puts ""
  puts "Please enter a number between 1 and 5."
  lyric_option_input = gets.chomp

  if lyric_option_input == "1"
  elsif lyric_option_input == "2"
  elsif lyric_option_input == "3"
  elsif lyric_option_input == "4"
  elsif lyric_option_input == "5"
  else
    puts "Sorry, that is incorrect."
    lyric_options
  end
end

def options_list(artistname, songname, lyrictext)
  puts "What would you like to do?"
  puts "(1) See lyrics."
  puts "(2) Lyrics analysis."
  puts "(3) Save this song to your favorites."
  puts "(4) Show your favorites list."
  puts "(5) Search for another song."
  puts "(6) Exit this program."
  puts ""
  puts "Please enter a number between 1 and 6."
  option_input = gets.chomp

  if option_input == "1"
    puts "#{lyrictext}"
    any_key = gets.chomp
    if gets.chomp || !gets.chomp
      options_list(artistname, songname, lyrictext)
    end
  elsif option_input == "2"
    lyric_options
    options_list(artistname, songname, lyrictext)
  elsif option_input == "3"
    current_user.check_and_save(artistname, songname, lyrictext)
    options_list(artistname, songname, lyrictext)
  elsif option_input == "4"
    # HOW TO SHOW FAVORITES???
  elsif option_input == "5"
    song_info = get_hash_using_song_and_artist
    artistname = artist_grabber(song_info)
    songname = song_grabber(song_info)
    lyrictext = lyric_grabber(song_info)
    options_list(artistname, songname, lyrictext)
  elsif option_input == "6"
    exit_app
  else
    puts "Sorry, that is incorrect."
    options_list(artistname, songname, lyrictext)
  end
end

# PROGRAM STARTS HERE

puts "Welcome to Lyrical"
puts "Please enter your username."
users_input_name = gets.chomp

if User.check_user(users_input_name) == false
  current_user = User.create(name: "#{users_input_name}")
  # user_artist = user_artist_request
  # user_song = user_song_request
  # song_info = api_call_response(user_artist, user_song)
  song_info = get_hash_using_song_and_artist
  artistname = artist_grabber(song_info)
  songname = song_grabber(song_info)
  lyrictext = lyric_grabber(song_info)
  options_list(artistname, songname, lyrictext)
else
  current_user = User.all.select do |user|
    user.name == users_input_name
  end
options_list(artistname, songname, lyrictext)
end
