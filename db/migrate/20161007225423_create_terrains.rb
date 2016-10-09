class CreateTerrains < ActiveRecord::Migration
  def change
    create_table :terrains do |t|
      t.string :name
      t.string :icon

      t.timestamps null: false
    end
  end
end
