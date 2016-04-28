class Question < ActiveRecord::Base
  belongs_to :user
  # a lambda to order answers
  # refer ar association for more methods (distinct etc.)
  has_many :answers, -> { order "created_at DESC" }, dependent: :destroy
  has_many :votes, class_name: "QuestionVote"

  validates :description, presence: true
  validates :caption, presence: true, length: { maximum: 50 }
end
