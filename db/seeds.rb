# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Client.create(name: "Gyuchan Lim", email: "gyuchaaan.lim@dummy.com", phone_number: "02123245613", age: "27", description: "This is dummy text")
Client.create(name: "Grace Feng", email: "gracef1119@dummy.com", phone_number: "0215171054", age: "28", description: "This is dummy text")
Client.create(name: "Mocha", email: "mocha@cutedoggies.com", phone_number: "123", age: "1", description: "This is dummy text")
Client.create(name: "Jihoon Sung", email: "jdogg@dummy.com", phone_number: "0212345678", age: "27", description: "This is dummy text")

Appointment.create(datetime: Time.new(2024, 12, 30, 12))
Appointment.create(datetime: Time.new(2024, 12, 30, 13))
Appointment.create(datetime: Time.new(2024, 12, 30, 14))
Appointment.create(datetime: Time.new(2024, 12, 30, 15))
Appointment.create(datetime: Time.new(2024, 12, 30, 16))

Client.find(1).appointments << Appointment.find(1)
Client.find(1).appointments << Appointment.find(2)
Client.find(1).appointments << Appointment.find(3)
Client.find(2).appointments << Appointment.find(2)
Client.find(2).appointments << Appointment.find(3)
Client.find(2).appointments << Appointment.find(4)
Client.find(3).appointments << Appointment.find(1)
Client.find(3).appointments << Appointment.find(3)
Client.find(3).appointments << Appointment.find(5)
Client.find(4).appointments << Appointment.find(2)
Client.find(4).appointments << Appointment.find(4)
Client.find(4).appointments << Appointment.find(5)
