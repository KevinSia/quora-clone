class CreateVotes < ActiveRecord::Migration
	def change
    remove_column :questions, :votes, :integer
    remove_column :answers, :votes, :integer

    create_table :question_votes do |q|
      q.integer :question_id
      q.integer :user_id
      q.integer :point, default: 0
      q.timestamps null: false
    end

    create_table :answer_votes do |a|
      a.integer :answer_id
      a.integer :user_id
      a.integer :point, default: 0
      a.timestamps null: false
    end

    add_index :question_votes, :question_id
    add_index :answer_votes, :answer_id
	end
end
