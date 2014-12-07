# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user1, class: :User do
    name "guangfu shi"
    email "stevegocoding@gmail.com"
    password "123"
    password_confirmation "123"
  end

  factory :user2, class: :User do
    name "user_name_2"
    email "foobar@gmail.com"
    password "123"
    password_confirmation "321"
  end
 
end
