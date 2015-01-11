require 'faker'

namespace :db do 

  desc 'Fill database with sample data' 
  task :populate => :environment do 
    puts "----------------"
    #puts "RAILS_ENV is #{RAILS_ENV}"
    puts "----------------"
 
    puts "----------------"
    puts "--- populate ---"
    puts "----------------"
 
    make_users
    make_projects
    make_tasks
  end
end

def make_users
  puts "----------------"
  puts "--- users ---"
  puts "----------------"

  5.times do |n| 
    username = Faker::Name.name
    email = Faker::Internet.email
    password = 'password'
    User.create!(username: username, 
                 email: email,
                 password: password)
  end
end

def make_projects
  puts "----------------"
  puts "--- projects ---"
  puts "----------------"
  
  inbox_proj = Project.new(name: 'inbox', desc: Faker::Lorem.sentence, owner_id: User.take.id)
  inbox_proj.save()
  
  3.times do |n|
    name = Faker::Lorem.word
    desc = Faker::Lorem.sentence
    user_id = User.take.id
    Project.create!(name: name, desc: desc, owner_id: user_id)
  end
end

def make_tasks
  r = Random.new
  
  # Some regular task without being associated with project and not sub tasks
  2.times do |n| 
    # Task.create(desc: Faker::Lorem.sentence, due_date: Faker::Date.forward(r.rand(1...7)), owner_id: User.take.id)
    due_date = time_rand(Time.local(2014, 12, 1), Time.local(2015, 1, 30)).to_date
    Task.create(desc: Faker::Lorem.sentence, due_date: due_date, owner_id: User.take.id)
  end 
  
  # Some project's tasks
  3.times do |n| 
    due_date = time_rand(Time.local(2014, 12, 1), Time.local(2015, 1, 30)).to_date
    Task.create(desc: Faker::Lorem.sentence, due_date: due_date, project_id: Project.take.id, owner_id: User.take.id)
  end 
  
  # Some sub-tasks
  3.times do |n| 
    due_date = time_rand(Time.local(2014, 12, 1), Time.local(2015, 1, 30)).to_date
    Task.create(desc: Faker::Lorem.sentence, due_date: due_date, task_list_id: Task.take.id, owner_id: User.take.id)
  end 
end

def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end
