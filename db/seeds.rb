admin = User.new(username: 'kevin', email: 'kevin@example.com')
admin.save_password = '123456'
admin.save

19.times do
  user = User.new(username: Faker::Name.name,
                  email: Faker::Internet.email)
  user.save_password = '123456'
  user.save
end

User.all.each do |user|
  rand(5..10).times do
    user.questions.create(description: Faker::Hipster.paragraph(rand(3..6), true, rand(4..6)),
                          caption: Faker::Hipster.sentence,
                          votes: rand(1..20))
  end
end

Question.all.each do |question|
  rand(5..10).times do
    question.answers.create(content: Faker::Lorem.paragraph(rand(3..6), true, rand(4..6)),
                            votes: rand(1..20),
                            user_id: rand(1..20))
  end
end