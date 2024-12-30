# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Client.create(name: "Gyuchan Lim", email: "gyuchaaan.lim@gmail.com", phone_number: "0226575883", age: "27", description: "This is dummy text")
Client.create(name: "Gyuchan Lim", email: "gracef1119@gmail.com", phone_number: "0210509251", age: "28", description: "This is dummy text")