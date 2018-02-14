require_relative '../config/environment.rb'

require 'rest-client'
require 'JSON'
require 'pry'
require 'magic_cloud'






# def api_call_response(artist, song)
artist_input = "The Black Eyed Peas & Justin Timberlake"
url_artist_input = artist_input.downcase.gsub(/[^a-zA-Z\s.]/,"").gsub(".", "").gsub(" ", "%20")

song_input = "Where Is The Love?"
url_song_input = song_input.downcase.gsub(/[^a-zA-Z\s.]/,"").gsub(".", "").gsub(" ", "%20")

api_call_response = RestClient.get("https://orion.apiseeds.com/api/music/lyric/#{url_artist_input}/#{url_song_input}?apikey=HQFSeDG9ANwvtoJgF4rUgai2RlVw7JI6Q6nrjUGCk8JSLSpfJYYwNhkV3o0bFyor")

lyrics = JSON.parse(api_call_response)['result']['track']['text']


def count_words(lyrics_string)
  word_list = Hash.new(0)
  words_with_commas = lyrics_string.downcase.gsub(/[^a-zA-Z\s.]/, "").split
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

stop_words_string = "i, me, my, myself, we, our, you, your, yourself, he, him, his, she, her, hers, it, its, they, them, their, theirs, what, which, who, whom, this, that, these, those, am, is, are, was, were, be, been, have, has, had, having, do, does, did, doing, would, should, could, ought, i'm, you're, he's, she's, it's, we're, they're, i've, you've, we've, they've, i'd, you'd, he'd, she'd, we'd, they'd, isn't, aren't, wasn't, weren't, hasn't, haven't, doesn't, don't, didn't, won't, wouldn't, shouldn't, can't, cannot, couldn't, let's, that's, who's, what's, here's, there's, when's, where's, why's, how's, a, an, the, and, but, if, or, as, while, of, at, by, for, with, into, to, from, in, out, on, off, then, here, there, when, where, why, how, all, any, both, each, few, more, most, other, some, such, no, nor, not, only, own, same, so, than, too, very, oh, said, say, dont, see, go, thats, youll, can, im, just, saying, yeah, now, ive, tho, though, up, down, got, right, left, through, let, gotta, cant, will, us, know, yall"

stop_words_array = stop_words_string.gsub(",", "").split

sorted_minus_stop_words = word_hash.delete_if {|word, count| stop_words_array.include? word}

puts sorted_minus_stop_words
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
