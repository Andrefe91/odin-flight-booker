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

def seed_database(number)
  airports = destinations(number)

  airports.each do |airport|
    Airport.create(name_code: airport.join)
  end
end


puts "Seeding the database with 20 records..."
seed_database(20)
puts "Seeding completed successfully"
