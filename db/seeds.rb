# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: "admim@example.com", password: "password")

Atom.create(name: "Test", class_name: "Atoms::Test::Test", enabled: false)
Atom.create(name: "Click", class_name: "Atoms::Event::Click", enabled: true)
Atom.create(name: "CssSelector", class_name: "Atoms::Matcher::CssSelector", enabled: true)
Atom.create(name: "Failed", class_name: "Atoms::Marker::Failed", enabled: true)
Atom.create(name: "Successful", class_name: "Atoms::Marker::Successful", enabled: true)
Atom.create(name: "Refresh", class_name: "Atoms::PageAction::Refresh", enabled: true)
Atom.create(name: "Text", class_name: "Atoms::Value::Text", enabled: true)
Atom.create(name: "Value", class_name: "Atoms::Value::Value", enabled: true)
Atom.create(name: "Visit", class_name: "Atoms::PageAction::Visit", enabled: true)
Atom.create(name: "First Match", class_name: "Atoms::Matcher::First", enabled: true)
Atom.create(name: "Skip", class_name: "Atoms::Marker::Skip", enabled: true)
Atom.create(name: "Last Match", class_name: "Atoms::Matcher::Last", enabled: true)
Atom.create(name: "Nth Match", class_name: "Atoms::Matcher::Nth", enabled: true)
Atom.create(name: "Each Match", class_name: "Atoms::Matcher::Each", enabled: true)
