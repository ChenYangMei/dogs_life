class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.boolean :open_at_all_times, :default => true
      t.string :open_times
      t.text :prohibited
      t.text :description
      t.text :image, :array => true, :default => []
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :info_link
      t.boolean :official, :default => true
      t.string :size

      t.integer :user_id

      t.timestamps null: false
    end
  end
end
