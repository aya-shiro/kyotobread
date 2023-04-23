# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
#    email: 'fromkyoto@gmail.com',
#    password: 'fromkyoto'
# )

unless Admin.exists?(email: 'fromkyoto@gmail.com')
  Admin.create!(
    email: 'fromkyoto@admin.com',
    password: 'fromkyoto'
  )
end

Drink.create!([
   { drink_name: 'コーヒー', default_select: true},
   { drink_name: '紅茶', default_select: true},
   { drink_name: '牛乳', default_select: true},
   { drink_name: 'お茶', default_select: true},
   ])