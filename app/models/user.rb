class User < ActiveRecord::Base

  # attributes
  attr_accessor :password

  # libraries
  include BCrypt
  has_secure_password # ActiveRecord > ActiveModel macro, creates method on-the-fly when called

  # validations
  validates :username, presence: true,
                       length: { maximum: 30 }
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :encrypted_password, presence: true

  # callbacks
  before_save :downcase_email

  # methods
  def downcase_email
    self.email = email.downcase
  end

end
