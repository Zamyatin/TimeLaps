# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{email: 'raj@foreversingh.com', password: 'testPass', username: "Zamyatin"}, {email:'beth@gmail.com', password: 'password', username: "Cynaria"}])

garages = Garage.create([{user_id: users.first, name: 'My Sweet Track Stuff'},
  {user_id: users.last, name: "My Urban Battle Wagons"}])

Car.create(make:"Honda", model:"S2000", color: 'red', owner_id: users.first)
Car.create(make:"Honda", model:'Civic', color: 'avocado', owner_id: users.last, trim:'Type-R')
Car.create(make:"Scion", model:'FR-S', color:'Firestorm', owner_id: users.first)