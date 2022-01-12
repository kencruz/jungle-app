class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 8}
  validates :password_confirmation, presence:true
  validates_confirmation_of :password
end
