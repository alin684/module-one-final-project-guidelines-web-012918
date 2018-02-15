class CreateSongs < ActiveRecord::Migration[5.0]
#Song Database container - join table between Users <-> Artists
  def change
    create_table :songs do |t|
      t.string  :name
      t.integer :artist_id
      # t.integer :lyric_id
    end
  end

end
