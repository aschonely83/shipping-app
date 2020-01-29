class User < ActiveRecord::Base
  validates_presence_of :email, :password_digest
  validates :email, uniqueness: true
  validates :email, :format => { 
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  has_secure_password
  has_many :retailers
end