# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# categories = EventbriteSDK::Category.list.page(1) #=> GET /v3/categories/?page=1

User.delete_all
user1=User.create(first_name: 'Gogo', last_name: 'Boo', email: 'boo@email.com', password: 'abc123')

event1=UserEvent.create(user_id: user1.id, event_id: 235)