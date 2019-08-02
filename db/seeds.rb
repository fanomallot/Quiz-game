# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
doc1 = Doctor.create(first_name: "Andhy" , last_name: "Pikina" , zip_code: "x22r7")
doc2 = Doctor.create(first_name: "Diaan" , last_name: "Kitaan" , zip_code: "r12c32")
doc1 = Doctor.create(first_name: "Xian" , last_name: "Aziza" , zip_code: "r3124")
pas1 = Patient.create(first_name: "Marar" , last_name: "Romuml")
pas2 = Patient.create(first_name: "Drop" , last_name: "Fifa")
pas3 = Patient.create(first_name: "Maad" , last_name: "Koak")
puts "chargement avec succés"