class CreateAreasTerrains < ActiveRecord::Migration
  def change
    create_table :areas_terrains do |t|
      t.integer :area_id
      t.integer :terrain_id
    end
  end
end
