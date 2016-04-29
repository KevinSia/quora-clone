class Answer < ActiveRecord::Base
	belongs_to :user
  belongs_to :question
  has_many :votes, class_name: "AnswerVote", dependent: :destroy

  validates :content, presence: true

  def upvote_count
    self.votes.where(point: 1).count
  end

  def downvote_count
    self.votes.where(point: -1).count
  end

end
