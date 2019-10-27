# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# categories = EventbriteSDK::Category.list.page(1) #=> GET /v3/categories/?page=1

Category.delete_all


categor1=Category.create(name: 'Music')
categor2=Category.create(name: 'Art')
categor3=Category.create(name: 'Sport')
categor4=Category.create(name: 'Education')
categor5=Category.create(name: 'Politics')
categor6=Category.create(name: 'Social')
categor7=Category.create(name: 'Kids')
categor8=Category.create(name: 'Science')
categor9=Category.create(name: 'Technology')
categor10=Category.create(name: 'Movie')
categor11=Category.create(name: 'Food')
categor12=Category.create(name: 'Entertainment')

e1=Event.create(name: "FlatIron Graduation", description: "Wellcome to Chilli's graduation", image: "", url: "", category_id: 4, user_id: 1, address: "91 Prospect Street, Brooklyn, NY", location_lat: "40.70066", location_long: "-73.9891832", date: "10/25/2019", start_time: "10:30", end_time: "12:30" )
e2=Event.create(name: "Farmer Market", description: "Local Farms Market. Selling fresh fruits, vegatables and very good cheese.", image: "", url: "", category_id: 11, user_id: 1, address: "Broadway & West 114th Street, New York, NY", location_lat: "40.80757", location_long: "-73.9663327", date: "10/24/2019", start_time: "10:00", end_time: "15:00" )
e3=Event.create(name: "Bernie Sanders Rally ", description: "New York Berney Sanders Rally. Music fun and socialism.", image: "", url: "", category_id: 5, user_id: 2, address: "Dumbo, Brooklyn, NY 11201", location_lat: "40.70426", location_long: "-73.9947347", date: "10/20/2019", start_time: "13:00", end_time: "17:00" )
e4=Event.create(name: "Seasame Street in Central Park", description: "Seasame Street monsters conquering Central Park.", image: "", url: "", category_id: 7, user_id: 1, address: "Central Park West Historic District", location_lat: "40.774931", location_long: "-73.971897", date: "10/26/2019", start_time: "10:00", end_time: "16:30" )
# e5=Event.create(name: "", :description: "", image: "", url: "", category_id: "", user_id: "", address: "", location_lat: "", location_long: "", date: "", start_time: "", end_time: "" )
# e6=Event.create(name: "", :description: "", image: "", url: "", category_id: "", user_id: "", address: "", location_lat: "", location_long: "", date: "", start_time: "", end_time: "" )
# e7=Event.create(name: "", :description: "", image: "", url: "", category_id: "", user_id: "", address: "", location_lat: "", location_long: "", date: "", start_time: "", end_time: "" )
# e8=Event.create(name: "", :description: "", image: "", url: "", category_id: "", user_id: "", address: "", location_lat: "", location_long: "", date: "", start_time: "", end_time: "" )
# e9=Event.create(name: "", :description: "", image: "", url: "", category_id: "", user_id: "", address: "", location_lat: "", location_long: "", date: "", start_time: "", end_time: "" )
# e10=Event.create(name: "", :description: "", image: "", url: "", category_id: "", user_id: "", address: "", location_lat: "", location_long: "", date: "", start_time: "", end_time: "" )
