class CreateLyrics < ActiveRecord::Migration[5.0]

  def change
    create_table :lyrics do |t|
      t.text :lyrics
      t.integer :song_id
    end
  end

end
