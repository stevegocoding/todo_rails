require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  
  should have_many(:sub_tasks).class_name("Task").with_foreign_key("task_list_id")
  should belong_to(:task_list).class_name("Task")
end
