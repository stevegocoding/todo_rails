class User < ActiveRecord::Base
  has_many :projects, foreign_key: :owner_id, dependent: :destroy
  has_many :tasks, foreign_key: :owner_id, dependent: :destroy
  
  has_secure_password
  validates :username, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: /\A([^@\s]+)@((?:[a-z0-9-]+\.)+[a-z]{2,})\z/i }
 
end
