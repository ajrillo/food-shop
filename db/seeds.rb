# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
csv_text = File.read('C:\Sites\SandwichShop\menu.txt')
csv2_text = File.read('C:\Sites\SandwichShop\deliveries.txt')

mycsv = CSV.parse(csv_text, :headers => true, :col_sep => "\t")
mycsv2 = CSV.parse(csv2_text, :headers => true, :col_sep => "\t")

#Order Seed = Runs!
mycsv.each do |row|
    Order.create(sandwich:row[0], condiments:row[1], quantity:row[2])
end

#Delivery Seed = Fails?
mycsv2.each do |row|
    Order.create(adress:row[0], street:row[1], city:row[2], state:row[3], ZipCode:row[4])
end