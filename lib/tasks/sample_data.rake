namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    9.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all
    62.times do
      name = Faker::Lorem.sentence(5)
      date = (Random.new.rand(1..31)).days.ago
      distance = Random.new.rand(1..4)
      duration = Random.new.rand(1..180)
      users.each { |user| user.workouts.create!(name: name, workout_date: date, distance: distance, duration: duration) }
    end
  end
end