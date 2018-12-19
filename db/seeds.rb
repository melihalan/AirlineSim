# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach(Rails.root.join('lib/seeds/Territories.csv'), headers: true) do |row|
  Territory.create!(
    name: row[0]
  )
end

CSV.foreach(Rails.root.join('lib/seeds/Countries.csv'), headers: true) do |row|
  Country.create!(
    name: row[0],
    territory_id: row[1]
  )
end

CSV.foreach(Rails.root.join('lib/seeds/Cities.csv'), headers: true) do |row|
  City.create!(
    country_id: row[0],
    name: row[1],
    latitude: row[2],
    longtitude: row[3],
    population: row[4],
    slots: row[5],
    ground_operations: row[6],
    landing_cost: row[7],
    boarding_cost: row[8],
    space_rent: row[9]
  )
end

puts "Territories, Countries and Cities have been loaded."

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

Staff.create!(
  hub_id: nil,
  plane_id: nil,
  name: "Roger Davis",
  job: "Pilot",
  salary: 16000
)

Staff.create!(
  hub_id: nil,
  plane_id: nil,
  name: "Alonzo Fratuew",
  job: "Pilot",
  salary: 16000
)

Staff.create!(
  hub_id: nil,
  plane_id: nil,
  name: "Rose Grund",
  job: "Pilot",
  salary: 16000
)

Staff.create!(
  hub_id: nil,
  plane_id: nil,
  name: "Mary James",
  job: "Host",
  salary: 6000
)

Staff.create!(
  hub_id: nil,
  plane_id: nil,
  name: "John Alfor",
  job: "Host",
  salary: 6000
)

Staff.create!(
  hub_id: nil,
  plane_id: nil,
  name: "Lora Finas",
  job: "Host",
  salary: 6000
)

Staff.create!(
  hub_id: nil,
  plane_id: nil,
  name: "George Pilotovski",
  job: "Officer",
  salary: 4500
)

Staff.create!(
  hub_id: nil,
  plane_id: nil,
  name: "Ana Pilotovski",
  job: "Officer",
  salary: 4500
)

Staff.create!(
  hub_id: nil,
  plane_id: nil,
  name: "Sarah Jonas",
  job: "Officer",
  salary: 4500
)

puts "9 staffs have been created."
