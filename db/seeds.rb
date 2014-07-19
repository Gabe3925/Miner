# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# CREATE TOOLS:
pickaxe = Tool.create(name: 'Pick Axe', speed: 1, price: 10)
shovel = Tool.create(name: 'Shovel', speed: 4, price: 18000)
drill = Tool.create(name: 'Pneumatic Drill', speed: 16, price: 80000)
bigdrill = Tool.create(name: 'Power Drill', speed: 32, price: 205000)
borer = Tool.create(name: 'Borer Machine', speed: 100, price: 600000)

#CREATE TEST USER
gabe = User.create(name: 'Gabe', dollars: 5000000, :password => "gabegabe", :password_confirmation => "gabegabe", :tool_id => "1")

#CREATE TEST-USERS MINE
gabe.mines << Mine.create(name: 'Gabes Great Mine', depth: 6000)




#CREATE TEST-USERS INVENTORY
# gabe.tools << pickaxe
