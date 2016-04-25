class User < ActiveRecord::Base

  # raw password will not be saved as password is not included in the table_col array
  attr_accessor :password

  # libraries
  include BCrypt
  # has_secure_password
      # ActiveRecord > ActiveModel macro, creates method on-the-fly when called
      # creates attributes password and password_confirmation

  # validations
  validates :username, presence: true,
                       length: { maximum: 30 }
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :encrypted_password, presence: true,
                                allow_nil: true # avoid conflict with has_secure_password
  validates :password, length: { minimum: 6 }

  # callbacks
  before_save :downcase_email

  # methods
  def downcase_email
    self.email = email.downcase
  end

  def digest_password=(new_password)
    digested_password = Password.create(new_password)
    self.encrypted_password = digested_password
  end
end
