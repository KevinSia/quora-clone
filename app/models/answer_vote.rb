class AnswerVote < ActiveRecord::Base
	belongs_to :answer
  belongs_to :user

  validates :user_id, presence: true
  validates :answer_id, presence: true, uniqueness: { scope: :user_id }
  #   validates :thought, :inclusion => { :in => [-1,1],
  #                                    message: "Invalid vote" }
  # validates :micropost, uniqueness: { scope: :user }

end
