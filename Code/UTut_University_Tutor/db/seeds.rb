# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = User.create(username: '000000000', firstname: 'Event', lastname: 'One', password: 'criticalisaw', password_confirmation: 'criticalisaw').save(validate: false)
@user = User.create(username: '201500002', firstname: 'Wilson', lastname: 'Tan', password: 'cs145', password_confirmation: 'cs145').save(validate: false)
@user = User.create(username: '201500001', firstname: 'Juan Felipe', lastname: 'Coronel', password: '123456', password_confirmation: '123456').save(validate: false)
