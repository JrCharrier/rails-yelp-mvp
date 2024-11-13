require 'faker'

puts "Destroy all..."
Restaurant.destroy_all
puts "Creating 5 restaurants ..."
5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
  restaurant.save!
  5.times do
    Review.create(
      content: Faker::Restaurant.review,
      rating: rand(0..5),
      restaurant: restaurant
    )
  end
end
puts "Restaurants created !!!"
