class Task < ActiveRecord::Base
  belongs_to :owner, class_name: :User
  has_many :sub_tasks, class_name: "Task", foreign_key: "task_list_id"
  belongs_to :project
  belongs_to :task_list, class_name: "Task"
  
  # Scopes
  scope :incomplete, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }
  
  scope :due_before, -> (due) { where("due_date < ?", due) }
  scope :overdue, -> { incomplete.where("due_date < ?",  Date.today) }
  
  scope :of_project, -> (project) { joins(:project).where("projects.name = ?", project) }
  scope :inbox, -> { of_project("inbox") }
  
end
