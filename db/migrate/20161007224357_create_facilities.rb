class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :icon

      t.timestamps null: false
    end
  end
end
