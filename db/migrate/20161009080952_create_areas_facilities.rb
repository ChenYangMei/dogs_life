class CreateAreasFacilities < ActiveRecord::Migration
  def change
    create_table :areas_facilities do |t|
      t.integer :area_id
      t.integer :facility_id
    end
  end
end
