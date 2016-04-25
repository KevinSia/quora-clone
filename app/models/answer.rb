class Answer < ActiveRecord::Base
	belongs_to :user
  belongs_to :questions

  validates :content, presence: true
end
