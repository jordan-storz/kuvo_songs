class Song < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.timestamps null: false
    end
  end
end
