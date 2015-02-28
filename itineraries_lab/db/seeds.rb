# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Itinerary.destroy_all
Destination.destroy_all


candice = User.create(first_name:"Candice", last_name:"Swanepoel", username:"eyecandy", password:"test")

alessandra = User.create(first_name:"Alessandra", last_name:"Ambrosio", username:"beautiful", password:"test")

karlie = User.create(first_name:"Karlie", last_name:"Kloss", username:"sexkitten", password:"test")


trip1 = Itinerary.create(name: "trip1", origin: "San Francisco", destination: "Tokyo", start_date: "2015-03-15", end_date: "2015-03-25")

  tokyo = Destination.create(name: "Club Womb", location: "Tokyo, Japan", start_date: "2015-03-15", end_date: "2015-03-18")
  hongKong = Destination.create(name: "Club Volar", location: "Honk Kong, China", start_date: "2015-03-19", end_date: "2015-03-22")
  singapore = Destination.create(name: "Zouk Club", location: "Singapore", start_date: "2015-03-23", end_date: "2015-03-25")


trip2 = Itinerary.create(name: "trip2", origin: "San Mateo", destination:"Gloucestershire", start_date: "2015-12-22", end_date: "2016-01-05" )

  tetbury = Destination.create(name: "Calcot Manor", location: "Tetbury, Gloucestershire", start_date: "2015-12-22", end_date: "2015-01-04")


trip3 = Itinerary.create(name: "trip3", origin: "San Clemente", destination: "Cuba", start_date: "2015-05-10", end_date: "2015-06-23")

  havana = Destination.create(name: "Santa Isabel", location: "Havana, Cuba", start_date: "2015-05-10", end_date: "2015-05-20")
  barbuda = Destination.create(name: "Antigua Hotel", location: "Barbuda", start_date: "2015-05-21", end_date: "2015-06-01")
  guana = Destination.create(name: "Guana Island", location: "Guana Island, British Virgin Islands", start_date: "2015-06-02", end_date: "2015-06-23")


candice.itineraries << trip1
alessandra.itineraries << trip2
karlie.itineraries << trip3

trip1.destinations << tokyo
trip1.destinations << hongKong
trip1.destinations << singapore

trip2.destinations << tetbury

trip3.destinations << havana
trip3.destinations << barbuda
trip3.destinations << guana

candice.destinations << tokyo
candice.destinations << hongKong