class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: {minumum: 3, maximum: 6}

  before_save { self.email.downcase! }

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip # converts to lower case and strips off the spaces in between
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
