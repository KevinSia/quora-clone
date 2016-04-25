class CreateQuestions < ActiveRecord::Migration
	def change
    create_table :questions do |q|
      q.text :description, null: false
      q.integer :votes, default: 0
      q.references :user, index: true, null: false
      q.timestamps null: false
    end
	end
end
