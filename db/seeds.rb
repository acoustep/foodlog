# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(email: 'foo@example.com', password: 'foopassword')
user2 = User.create(email: 'bar@example.com', password: 'barpassword')

Post.create([
	{ title: 'post 1' },
	{ title: 'post 2' },
	{ title: 'post 3' }
])
Meal.create([
	{ name: 'apple', user_id: user.id },
	{ name: 'orange', user_id: user2.id },
	{ name: 'milk', user_id: user2.id }
])
