# Sample categories
american = Category.where(name: "American").first_or_create(name: "American")
chinese = Category.where(name: "Chinese").first_or_create(name: "Chinese")
french = Category.where(name: "French").first_or_create(name: "French")
greek = Category.where(name: "Greek").first_or_create(name: "Greek")
indian = Category.where(name: "Indian").first_or_create(name: "Indian")
italian = Category.where(name: "Italian").first_or_create(name: "Italian")
japanese = Category.where(name: "Japanese").first_or_create(name: "Japanese")
mexican = Category.where(name: "Mexican").first_or_create(name: "Mexican")
thai = Category.where(name: "Thai").first_or_create(name: "Thai")

# Sample users
50.times do |n|
  User.create!(name: Faker::Name.name, email: "example-#{n+1}@example.com",
               password: "password", password_confirmation: "password")
end

# Sample restaurants
locations = [ { city: "Islington", county: "London"}, { city: "Hackney", county: "London"},
              { city: "Angel", county: "London"}, { city: "Paddington", county: "London"},
              { city: "Kingston", county: "Middlesex"}, { city: "Brentford", county: "Middlesex"},
              { city: "Guildford", county: "Surrey"}, { city: "Croydon", county: "Surrey"},
            ]
100.times do
  location = locations.sample
  Restaurant.create!(name: Faker::Restaurant.name, category_id: rand(1..9),
                     city: location[:city], county: location[:county])
end

# Sample reviews
users_group_1 = User.all[0..24]
users_group_2 = User.all[25..49]
33.times do
  users_group_1.each do |user|
    review = user.reviews.create!(content: Faker::Restaurant.review, rating: rand(1..5), restaurant_id: rand(1..100))
    review.update_attribute(:created_at, rand(1..500).days.ago)
  end
end

4.times do
  users_group_2.each do |user|
    review = user.reviews.create!(content: Faker::Restaurant.review, rating: rand(1..5), restaurant_id: rand(1..100))
    review.update_attribute(:created_at, rand(1..50).days.ago)
  end
end
