class Question < ActiveRecord::Base
  belongs_to :user
  # a lambda to order answers
  # refer ar association for more methods (distinct etc.)
  has_many :votes, class_name: "QuestionVote", dependent: :destroy
  has_many :answers, -> { order "created_at DESC" }, dependent: :destroy

  validates :description, presence: true
  validates :caption, presence: true, length: { maximum: 50 }

  def upvote_count
    self.votes.where(point: 1).count
  end

  def downvote_count
    self.votes.where(point: -1).count
  end

end
