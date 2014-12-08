class Task < ActiveRecord::Base
  has_many :sub_tasks, class_name: "Task", foreign_key: "task_list_id"
  belongs_to :task_list, class_name: "Task"
end
