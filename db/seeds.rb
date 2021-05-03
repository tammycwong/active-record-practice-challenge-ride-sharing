puts "Clearing old data..."
Ride.destroy_all
Passenger.destroy_all
Driver.destroy_all

puts "Seeding passengers..."
# Create sample passengers
50.times do
  Passenger.create(first_name: Faker::Name.name,
                   last_name: Faker::Name.last_name,
                   rating: rand(1...5).to_f,
                   email: Faker::Internet.email,
                   cell_number: Faker::PhoneNumber.cell_phone)
end

puts "Seeding drivers..."
# Create 10 random Drivers
50.times do
  Driver.create(first_name: Faker::Name.name,
                last_name: Faker::Name.name,
                email: Faker::Internet.email,
                rating: rand(1...5).to_f,
                car: Faker::Vehicle.make_and_model,
                car_color: Faker::Vehicle.color,
                license_plate: Faker::Vehicle.license_plate,
                car_year: Faker::Vehicle.year,
                bio: Faker::Quote.most_interesting_man_in_the_world)
end

puts "🚗🚗🚗 Seeding rides 🚗🚗🚗..."
# Create 20 random rides
70.times do
  # Get a driver instance:
  driver_id = Driver.ids.sample
  # Get a passenger instance:
  passenger_id = Passenger.ids.sample
  # Get a random price between 1 and 1000:
  price = rand(1..1000).to_f

  # TODO: create rides! Remember, a ride belongs to a driver
  # and a ride belongs to a passenger. Driver -< Ride >- Passenger

  # Use Faker for some fake pick up/drop off data:
  # https://github.com/faker-ruby/faker/blob/master/doc/default/address.md

end

puts "Done!"
