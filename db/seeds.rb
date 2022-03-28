# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Manufacturer.destroy_all
Guitar.destroy_all

fender = Manufacturer.create!(
  name: "Fender",
  headquarter_city: "Los Angeles",
  years_in_business: 76,
  custom_shop: true
  )
gibson = Manufacturer.create!(
  name: "Gibson",
  headquarter_city: "Nashville",
  years_in_business: 120,
  custom_shop: true
  )
ibanez = Manufacturer.create!(
  name: "Ibanez",
  headquarter_city: "Nagoya",
  years_in_business: 65,
  custom_shop: true
  )
prs = Manufacturer.create!(
  name: "Paul Reed Smith",
  headquarter_city: "Towson",
  years_in_business: 37,
  custom_shop: false
  )
music_man = Manufacturer.create!(
  name: "Ernie Ball Music Man",
  headquarter_city: "San Luis Obispo",
  years_in_business: 48,
  custom_shop: false
  )

fender.guitars.create!(
  model: "Stratocaster",
  num_of_frets: 21,
  six_string: true
  )
fender.guitars.create!(
  model: "Telecaster",
  num_of_frets: 21,
  six_string: true
  )
gibson.guitars.create!(
  model: "Les Paul",
  num_of_frets: 22,
  six_string: true
  )
gibson.guitars.create!(
  model: "SG",
  num_of_frets: 22,
  six_string: true
  )
gibson.guitars.create!(
  model: "ES-335",
  num_of_frets: 22,
  six_string: true
  )
ibanez.guitars.create!(
  model: "Prestige",
  num_of_frets: 24,
  six_string: true
  )
ibanez.guitars.create!(
  model: "Jem 7",
  num_of_frets: 24,
  six_string: false
  )
prs.guitars.create!(
  model: "Custom 22",
  num_of_frets: 22,
  six_string: true
  )
prs.guitars.create!(
  model: "Custom 24",
  num_of_frets: 24,
  six_string: true
  )
prs.guitars.create!(
  model: "Santana",
  num_of_frets: 22,
  six_string: true
  )
music_man.guitars.create!(
  model: "JP6",
  num_of_frets: 24,
  six_string: true,
  )
music_man.guitars.create!(
  model: "JP7",
  num_of_frets: 24,
  six_string: false,
  )
music_man.guitars.create!(
  model: "Silhouette",
  num_of_frets: 24,
  six_string: true,
  )
