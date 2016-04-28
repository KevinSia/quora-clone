class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy

  validates :description, presence: true
  validates :caption, presence: true
end
