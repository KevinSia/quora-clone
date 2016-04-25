admin = User.new(username: 'kevin', email: 'kevin@example.com')
admin.save_password = '123456'
admin.save

19.times do
  user = User.new(username: Faker::Name.name,
                  email: Faker::Internet.email)
  user.save_password = '123456'
  user.save
end

20.times do |index|
  Question.create(description: Faker::Hipster.paragraph(rand(3..6), true, rand(4..6)),
                  votes: rand(1..20),
                  user_id: index)
end

20.times do |index|
  rand(5..10).times do
    Answer.create(content: Faker::Lorem.paragraph(rand(3..6), true, rand(4..6)),
                  votes: rand(1..20),
                  user_id: rand(1..20),
                  question_id: index)
  end
end