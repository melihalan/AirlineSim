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
    available_slots: row[6],
    landing_cost: row[7],
    boarding_cost: row[8],
    space_rent: row[9],
    hub_opening_cost: row[10],
    accomadation_cost: row[11]
  )
end

puts "Territories, Countries and Cities have been loaded."

CSV.foreach(Rails.root.join('lib/seeds/PlaneManufacturers.csv'), headers: true) do |row|
  PlaneManufacturer.create!(
    name: row[0]
  )
end

CSV.foreach(Rails.root.join('lib/seeds/PlaneModelFamilies.csv'), headers: true) do |row|
  PlaneModelFamily.create!(
    plane_manufacturer_id: row[0],
    name: row[1],
    production_capacity: row[2],
  )
end

CSV.foreach(Rails.root.join('lib/seeds/PlaneModels.csv'), headers: true) do |row|
  PlaneModel.create!(
    id: row[0],
    plane_manufacturer_id: row[1],
    plane_model_family_id: row[2],
    name: row[3],
    range: row[4],
    max_pas: row[5],
    avg_speed: row[6],
    fuel_use: row[7],
    cost: row[8],
    maintanence: row[9],
    pilots: row[10],
    hosts: row[11],
    size: row[12],
    counter: row[13]
  )
end

CSV.foreach(Rails.root.join('lib/seeds/SeatConfigurations.csv'), headers: true) do |row|
  SeatConfiguration.create!(
    id: row[0],
    plane_model_id: row[1],
    economy_class: row[2],
    business_class: row[3],
    first_class: row[4],
    passenger: row[5]
  )
end

puts "Plane Manufacturers, Plane Model Families, Plane Models and Seat Configurations have been loaded."

CSV.foreach(Rails.root.join('lib/seeds/StaffNames.csv'), headers: true) do |row|
  StaffName.create!(
    name: row[0],
    surname: row[1]
  )
end

puts "Names and Surnames have been loaded."

Turn.create!(
  term: DateTime.civil(2019,1)
)

puts "The game will start at January 2019."
