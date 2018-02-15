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
# require 'magic_cloud'

  def user_artist_request
  puts "What artist are you looking for?"
  user_artist_input = gets.chomp
  user_artist_input
  #= Artist.new(name: "#{user_artist_input}")
  #ONLY AS AN INSTANCE OF THIS, DOES NOT PERSIST
  end

  def user_song_request
  puts "What song are you looking for?"
  user_song_input = gets.chomp
  user_song_input
  # = Song.new(name: "#{user_song_input}")
  end

  def song_and_artist_request
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

def api_call_response (user_artist_input, user_song_input)
 artist_input = "#{user_artist_input}"
  url_artist_input = artist_input.downcase.gsub(/[^a-zA-Z\s.]/,"").gsub(".", "").gsub(" ", "%20")
 song_input = "#{user_song_input}"
  url_song_input = song_input.downcase.gsub(/[^a-zA-Z\s.]/,"").gsub(".", "").gsub(" ", "%20")
    begin
      api_call_response = RestClient.get("https://orion.apiseeds.com/api/music/lyric/#{url_artist_input}/#{url_song_input}?apikey=HQFSeDG9ANwvtoJgF4rUgai2RlVw7JI6Q6nrjUGCk8JSLSpfJYYwNhkV3o0bFyor")
      rescue
        puts "No song and artist found - please try again."
        song_and_artist_request
      else
        #Successul match found
      song_info = JSON.parse(api_call_response)
    end
    song_info
    # HASH of song info
end




puts "Welcome to the Lyric Checker App"

# def user_name_request
puts "Please enter your name."
users_input_name = gets.chomp

if User.check_user(users_input_name) == false
  new_user = User.create(name: "#{users_input_name}")
  user_artist = user_artist_request
  user_song = user_song_request
  song_info = api_call_response(user_artist, user_song)
  binding.pry

  aname = artist_grabber(song_info)
  sname = song_grabber(song_info)
  ltext = lyric_grabber(song_info)

  new_user.check_and_save(aname, sname, ltext)
  binding.pry
else
  existing_user = User.all.select do |user|
    user.name == users_input_name
  end
  puts "go to the methods"
  existing_user.check_and_save(artist_name, song_name, lyrics)
end

# binding.pry


# if User.all.name.include?(users_input_name)
#   if true then go to options_lists
#If profile already exists, then we need a jump to a command that says would you like to see your favorites list, search for songs, or exit
#Saves user to the DB
# end





# def options_list
# #1. see lyrics
# #2. exit app
# #3. search for another song
# #4. analyze song lyrics --> goes to a new list of seperate options
# #5. see your favorites
# end
#
#
#
# after you input garbage and get back youyr lytics then have an option to save, then that will create the artiust into the db,
# the song into the db amnd the lyrics into the db as well
# otherwise the result comes back and were going to eat pizza
#if i get lyrics abck i ahev abn option to SAVES

#   def api_call_response (user_artist_input, user_song_input)
#     artist_input = "#{user_artist_input.name}"
#     url_artist_input = artist_input.downcase.gsub(/[^a-zA-Z\s.]/,"").gsub(".", "").gsub(" ", "%20")
#     song_input = "#{user_song_input.name}"
#     url_song_input = song_input.downcase.gsub(/[^a-zA-Z\s.]/,"").gsub(".", "").gsub(" ", "%20")
#
#     begin
#
#     api_call_response = RestClient.get("https://orion.apiseeds.com/api/music/lyric/#{url_artist_input}/#{url_song_input}?apikey=HQFSeDG9ANwvtoJgF4rUgai2RlVw7JI6Q6nrjUGCk8JSLSpfJYYwNhkV3o0bFyor")
#     rescue
#       song_and_artist_request
#     else
#
#       lyrics = JSON.parse(api_call_response)['result']['track']['text']
# binding.pry
#       puts "#{lyrics}"
#     end
#
#
#
#
# end

      #
      #
      # def count_words(lyrics_string)
      #   word_list = Hash.new(0)
      #   words_with_commas = lyrics_string.downcase.gsub(/[^a-zA-Z\s.]/, "").split
      #   words_without_commas = words_with_commas.map do |word|
      #     if word[0] == ','
      #       word = word[1..-1]
      #     elsif word[-1] == ','
      #       word = word[0..-2]
      #     else
      #       word
      #     end
      #   end
      #   # gets rid of commas in front of/behind words that gsub wasn't getting
      #   words_without_commas.map { |word| word_list[word] += 1 }
      #   # puts words in word_list as key and increments by count
      #   sorted_count = word_list.sort_by {|word, count| count}.reverse.to_h
      #   # sorts word_list by count, puts in descending order,changes it into hash
      #   # BEFORE CHANGING TO HASH, save to variable to use for Magic Cloud
      #   sorted_count
      # end
      #
      # word_hash = count_words(lyrics)
      #
      # stop_words_string = "i, me, my, myself, we, our, you, your, yourself, he, him, his, she, her, hers, it, its, they, them, their, theirs, what, which, who, whom, this, that, these, those, am, is, are, was, were, be, been, have, has, had, having, do, does, did, doing, would, should, could, ought, i'm, you're, he's, she's, it's, we're, they're, i've, you've, we've, they've, i'd, you'd, he'd, she'd, we'd, they'd, isn't, aren't, wasn't, weren't, hasn't, haven't, doesn't, don't, didn't, won't, wouldn't, shouldn't, can't, cannot, couldn't, let's, that's, who's, what's, here's, there's, when's, where's, why's, how's, a, an, the, and, but, if, or, as, while, of, at, by, for, with, into, to, from, in, out, on, off, then, here, there, when, where, why, how, all, any, both, each, few, more, most, other, some, such, no, nor, not, only, own, same, so, than, too, very, oh, said, say, dont, see, go, thats, youll, can, im, just, saying, yeah, now, ive, tho, though, up, down, got, right, left, through, let, gotta, cant, will, us, know, yall"
      #
      # stop_words_array = stop_words_string.gsub(",", "").split
      #
      # sorted_minus_stop_words = word_hash.delete_if {|word, count| stop_words_array.include? word}
      #
      # puts sorted_minus_stop_words
# word_hash minus stop words


# puts word_hash
#
# puts Hash[word_hash.to_a[0,5]]
# # # returns top 5 most used words and their count
#
# num_unique_words = word_hash.length
# # # counts number of hash keys = number of unique words
#
# puts num_unique_words
#
# word_hash.values.inject { |a, b| a + b }


# binding.pry
# words = [
#   ['test', 50],
#   ['me', 40],
#   ['tenderly', 30]
# ]
# cloud = MagicCloud::Cloud.new(words, rotate: :free, scale: :log)
# draws cloud
