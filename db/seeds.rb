# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PlaneModel.create!(
  name: "Boeing 737",
  range: 4500,
  avg_speed: 750,
  max_pas: 180,
  fuel_use: 2,
  cost: 47000000,
  maintanence: 150000,
  pilots: 2,
  hosts: 3
)

PlaneModel.create!(
  name: "Airbus A321",
  range: 4000,
  avg_speed: 800,
  max_pas: 160,
  fuel_use: 2,
  cost: 40000000,
  maintanence: 100000,
  pilots: 2,
  hosts: 3
)

PlaneModel.create!(
  name: "Boeing 777",
  range: 6000,
  avg_speed: 800,
  max_pas: 450,
  fuel_use: 4,
  cost: 92000000,
  maintanence: 200000,
  pilots: 2,
  hosts: 6
)

puts "3 Plane Models have been created."

City.create!(
  name: "Istanbul",
  latitude: 41.015137,
  longtitude: 28.979530,
  population: 14000000
)

City.create!(
  name: "London",
  latitude: 51.509865,
  longtitude: -0.118092,
  population: 7000000
)

puts "2 Cities have been created."
