# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tod = User.create(first_name: 'tod', password: 'password123', password_confirmation: 'password123', username: 'tod5513')
greg = User.create(first_name: 'greg', password: 'password123',password_confirmation: 'password123', username: 'greeeegg133')
# f1 = Friendship.create(user_id: tod.id, friend_id: greg.id)
Act1 = ActionInfo.create(name: "working", user_id: tod.id)

stat1 = Stat.create(action_name: "brushing teeth", action_amount: 1, user_id: tod.id)
stat2 = Stat.create(action_name: "working out", action_amount: 1, user_id: tod.id)
stat3 = Stat.create(action_name: "eating salad", action_amount: 1, user_id: tod.id)