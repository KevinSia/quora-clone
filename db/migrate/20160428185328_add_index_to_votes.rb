class AddIndexToVotes < ActiveRecord::Migration
	def change
    add_index :question_votes, [:user_id, :question_id], unique: true
    add_index :answer_votes, [:user_id, :answer_id], unique: true
	end
end
