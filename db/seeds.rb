# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#CREATE TEST USER
gabe = User.create(id: 1, name: 'Gabe', dollars: 81, mines_id: 1, :password => "gabegabe", :password_confirmation => "gabegabe")
gabe.mines << Mine.create(name: 'Gabes Great Mine', depth: 6)


# CREATE TOOLS:
pickaxe = Tool.create(name: 'Pick Axe', speed: 1, price: 100)
shovel = Tool.create(name: 'Pick Axe', speed: 1, price: 100)
drill = Tool.create(name: 'Pick Axe', speed: 1, price: 100)
bigdrill = Tool.create(name: 'Pick Axe', speed: 1, price: 100)
borer = Tool.create(name: 'Pick Axe', speed: 1, price: 100)

#CREATE TEST-USERS INVENTORY
gabe.tools << pickaxe
