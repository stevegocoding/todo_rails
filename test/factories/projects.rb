# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "test_project"
    desc "a test project"
    user1
  end
end
