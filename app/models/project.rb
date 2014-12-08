class Project < ActiveRecord::Base
  belongs_to :owner, class_name: :User
  has_many :tasks, foreign_key: :project_id, dependent: :destroy
  
  validates :name, :owner, presence: true
end
