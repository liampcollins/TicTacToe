class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :username, :password, :password_confirmation
  
  validates :email, presence: true, uniqueness: true

  belongs_to :game
  has_many :moves

end
