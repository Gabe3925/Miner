# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# CREATE TOOLS:
pickaxe = Tool.create(name: 'Pick Axe', speed: 1, price: 10)
shovel = Tool.create(name: 'Shovel', speed: 2, price: 500)
drill = Tool.create(name: 'Pneumatic Drill', speed: 3, price: 4000)
bigdrill = Tool.create(name: 'Power Drill', speed: 6, price: 8000)
borer = Tool.create(name: 'Borer Machine', speed: 12, price: 150000)

#CREATE TEST USER
gabe = User.create(id: 0, name: 'Gabe', dollars: 81, :password => "gabegabe", :password_confirmation => "gabegabe", :tool_id => "1")

#CREATE TEST-USERS MINE
gabe.mines << Mine.create(name: 'Gabes Great Mine', depth: 6)




#CREATE TEST-USERS INVENTORY
# gabe.tools << pickaxe
