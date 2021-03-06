class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: {minimum:8}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    @user = self.where("lower(email) = ?", email.delete(' ').downcase).first.try(:authenticate, password)
  end
end
