class CreateAnswers < ActiveRecord::Migration
	def change
    create_table :answers do |a|
      a.text :content, null: false
      a.integer :votes, default: 0
      a.references :user, index: true, null: false
      a.timestamps null: false
    end
	end
end
