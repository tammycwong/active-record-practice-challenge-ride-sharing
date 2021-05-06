puts "Clearing old data..."
Ride.destroy_all
Passenger.destroy_all
Driver.destroy_all

puts "🙋‍♀️🙋‍♀️🙋‍♀️ Seeding passengers 🙋‍♀️🙋‍♀️🙋‍♀️..."
20.times do
  Passenger.create(first_name: Faker::Name.name,
                   last_name: Faker::Name.last_name,
                   rating: rand(1...5),
                   email: Faker::Internet.email,
                   cell_number: Faker::PhoneNumber.cell_phone)
end

puts "✇✇✇ Seeding drivers ✇✇✇..."
20.times do
  Driver.create(first_name: Faker::Name.name,
                last_name: Faker::Name.name,
                email: Faker::Internet.email,
                rating: rand(1...5),
                car: Faker::Vehicle.make_and_model,
                car_color: Faker::Vehicle.color,
                license_plate: Faker::Vehicle.license_plate,
                car_year: Faker::Vehicle.year,
                bio: Faker::Quote.most_interesting_man_in_the_world)
end

puts "🚗🚗🚗 Seeding rides 🚗🚗🚗..."
# Create 20 random rides
50.times do

  # TODO: create rides! Remember, a ride belongs to a driver
  # and a ride belongs to a passenger. Driver -< Ride >- Passenger

  # Feel free to use Faker for some fake pick up/drop off address data:
  # https://github.com/faker-ruby/faker/blob/master/doc/default/address.md
  Ride.create(driver_id: Driver.all.sample.id, 
              passenger_id: Passenger.all.sample.id,
              drop_off: Faker::Address.full_address,
              pick_up: Faker::Address.full_address,
              price: rand(1...400))
end

puts "Done seeding! 🌸"
