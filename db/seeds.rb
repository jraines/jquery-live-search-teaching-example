# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


animals = [{name: "Aardvark",
            description: "A zero of an animal"},
            {name: "Bear",
             description: "A bear for your yard"},
            {name: "Cat",
             description: "An extra nice cat"},
            {name: "Dog",
             description: "Wolf descendent"},
            {name: "Emu",
             description: "Very nice bird"}]

animals.each do |animal|
  Product.create! animal
end
