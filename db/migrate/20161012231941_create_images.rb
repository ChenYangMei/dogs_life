class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|

      t.text :public_id
      t.text :url

      t.integer :area_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
