# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Airport.destroy_all

def random_three
  result = []
  3.times do
    result << [*('A'..'Z')].sample
  end
  result
end

def destinations(number)
  total_destinations = []
  number.times do
    total_destinations << random_three
  end
  total_destinations.uniq
end

def seed_airports(number)
  airports = destinations(number)

  airports.each do |airport|
    Airport.create(name_code: airport.join)
  end
end

def seed_flights(airports, flights)
  flights.times do
    Flight.create(departure_airport_id: rand(airports), arrival_airport_id: rand(airports), duration: rand(420),
    date: (Date.today + rand(60)))
  end
end

puts "Seeding the flights and airports databases..."
seed_airports(20)
seed_flights(20, 500)
puts "Seeding completed successfully"
