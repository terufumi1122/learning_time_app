# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: 'user',
  email: 'user@sample.com',
  password: 'password',
  password_confirmation: 'password'
)

Record.create!(
  start_time: '2019-11-30 06:56:37',
  stop_time: '2019-11-30 06:59:37',
  lap_time: 180,
  user_id: 0
)
