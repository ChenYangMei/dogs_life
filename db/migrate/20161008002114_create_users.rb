class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # Omniauth
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at

      # Own login
      t.string :user_name
      t.string :email
      t.text :password_digest
      t.boolean :admin, :default => false
      t.text :image

      t.timestamps null: false
    end
  end
end
