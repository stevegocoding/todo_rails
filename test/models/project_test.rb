require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  
  should belong_to(:owner).class_name('User')
  should have_many(:tasks).with_foreign_key('project_id')
  
end
