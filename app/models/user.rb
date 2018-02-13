class User < ActiveRecord::Base
  has_many: :songs, through: :favorites
  has_many: :favorites






end
