require_relative '../config/environment.rb'

require 'rest-client'
require 'JSON'
require 'pry'
require 'magic_cloud'

# def api_call_response(artist, song)
  artist_name = 'taylor%20swift'
  song_name = 'love%20story'
  api_call_response = RestClient.get("https://orion.apiseeds.com/api/music/lyric/#{artist_name}/#{song_name}?apikey=HQFSeDG9ANwvtoJgF4rUgai2RlVw7JI6Q6nrjUGCk8JSLSpfJYYwNhkV3o0bFyor")

parsed_response = JSON.parse(api_call_response)

lyrics = parsed_response['result']['track']['text']


def count_words(lyrics_string)
  word_list = Hash.new(0)
  words_with_commas = lyrics_string.downcase.gsub(/[^a-zA-Z\s.]/, "").split
  # get rid of special chars, not fully working
  words_without_commas = words_with_commas.map do |word|
    if word[0] == ','
      word = word[1..-1]
    elsif word[-1] == ','
      word = word[0..-2]
    else
      word
    end
  end
  # gets rid of commas in front of/behind words that gsub wasn't getting
  words_without_commas.map { |word| word_list[word] += 1 }
  # puts words in word_list as key and increments by count
  sorted_count = word_list.sort_by {|word, count| count}.reverse.to_h
  # sorts word_list by count, puts in descending order,changes it into hash
  # BEFORE CHANGING TO HASH, save to variable to use for Magic Cloud
  sorted_count
end

word_hash = count_words(lyrics)
#
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
words = [
  ['test', 50],
  ['me', 40],
  ['tenderly', 30]
]
cloud = MagicCloud::Cloud.new(words, rotate: :free, scale: :log)
draws cloud
