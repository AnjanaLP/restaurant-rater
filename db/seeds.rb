# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.where(name: "Italian").first_or_create(name: "Italian")
Category.where(name: "Chinese").first_or_create(name: "Chinese")
Category.where(name: "French").first_or_create(name: "French")
Category.where(name: "American").first_or_create(name: "American")
Category.where(name: "Japanese").first_or_create(name: "Japanese")
Category.where(name: "Indian").first_or_create(name: "Indian")
Category.where(name: "Mexican").first_or_create(name: "Mexican")
