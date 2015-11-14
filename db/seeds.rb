# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

users = User.create! [ 
	{ username: "Fiorina", password_digest: "foo" },
	{ username: "Trump", password_digest: "foo" },
	{ username: "Carson", password_digest: "foo" },
	{ username: "Clinton", password_digest: "foo" } 
]
carly_profile = Profile.create! [ 
	{ 
		first_name: "Carly", 
		last_name: "Fiorina", 
		birth_year: 1954, 
		gender: "female", 
		user: users[0] 
	},
	{
		first_name: "Donald", 
		last_name: "Trump", 
		birth_year: 1946, 
		gender: "male", 
		user: users[1] 
	},
	{
		first_name: "Ben", 
		last_name: "Carson", 
		birth_year: 1951, 
		gender: "male", 
		user: users[2]  
	},
	{
		first_name: "Hillary", 
		last_name: "Clinton", 
		birth_year: 1947, 
		gender: "female", 
		user: users[3] 
	}
	] 

due_date = Date.today + 1.year
users.each do |user|
	todo_list = TodoList.create! [
		{
			list_name: "#{user.profile.first_name}'s Todo List",
			list_due_date: due_date,
			user: user
		}
	]
	(0..4).each do |i|
		todo_item = TodoItem.create! [ 
			{
				due_date: due_date,
				title: "Item #{i}",
				description: "Win the damend election #{user.profile.last_name}!",
				completed: false,
				todo_list: todo_list.first
			}
		]
	end
end
