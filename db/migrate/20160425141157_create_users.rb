class CreateUsers < ActiveRecord::Migration
	def change
    create_table :users do |u|
      u.string :username
      u.string :email, unique: true
      u.string :encrypted_password, null: false
      u.timestamps null: false
    end
	end
end
