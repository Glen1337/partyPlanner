Party.create(name: "christmas party", location: "inside", description: "good")
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
require "faker"

# 20.times do
#   Party.create(name: "#{Faker::StarWars.planet}", description:"#{Faker::BreakingBad.episode}" , location:"#{Faker::Address.full_address}")
# end

Party.create(name: "random party", location: "conference room", description: "none")
Party.create(name: "christmas party", location: "conference room", description: "none")
Party.create(name: "birthday party", location: "office", description: "none")
Party.create(name: "dundies", location: "chili's", description: "awards")
Friend.create(first_name:"dwight" , last_name: "schrute" )
Friend.create(first_name:"jim", last_name: "halpert")
Friend.create(first_name:"michael", last_name: "scott")
Friend.create(first_name:"andy", last_name: "bernard")
