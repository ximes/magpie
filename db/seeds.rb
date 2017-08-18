# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: "admim@example.com", password: "password")

Atom.create(name: "Click", class_name: "Atoms::Events::Click", enabled: true)
Atom.create(name: "CssSelector", class_name: "Atoms::Matchers::CssSelector", enabled: true)
Atom.create(name: "Failed", class_name: "Atoms::Markers::Failed", enabled: true)
Atom.create(name: "Successful", class_name: "Atoms::Markers::Successful", enabled: true)
Atom.create(name: "Refresh", class_name: "Atoms::PageActions::Refresh", enabled: true)
Atom.create(name: "Text", class_name: "Atoms::Values::Text", enabled: true)
Atom.create(name: "Value", class_name: "Atoms::Values::Value", enabled: true)
