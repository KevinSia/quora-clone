class User < ActiveRecord::Base

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
  validates :encrypted_password, presence: true
  validates :user_password, length: { minimum: 6 }

  # callbacks
  before_save :downcase_email

  # methods
  def downcase_email
    self.email = email.downcase
  end

  # used in login
  def password
    @password ||= Password.new(encrypted_password)
  end

  # used to login
  def authenticate(login_password)
    self.password == login_password
  end

  # used to store hash in db
  def digest_password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end

  # used for length validation
  def user_password
    @password
  end

end
