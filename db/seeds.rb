# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  Transaction.create({ transaction_id: Faker::Crypto.md5, customer_id: Faker::Crypto.md5,
                       input_amount: Faker::Commerce.price,
                       input_currency: Faker::Currency.code,
                       output_amount: Faker::Commerce.price,
                       output_currency: Faker::Currency.code })
end
