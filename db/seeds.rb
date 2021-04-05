# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Luke", password: "1234", password_confirmation: "1234")

Muppet.create(name: "Kermit")
Muppet.create(name: "Fozzie")
Muppet.create(name: "Gonzo")
Muppet.create(name: "Piggy")

Show.create(name: "Big Reunion", date: "2022-03-17", user_id: 1)
Show.create(name: "Bigger Reunion", date: "2023-04-12", user_id: 1)

MuppetShow.create(job: "Director", muppet_id: 1, show_id: 1)
MuppetShow.create(job: "Comedian", muppet_id: 2, show_id: 1)

MuppetShow.create(job: "Stuntman", muppet_id: 3, show_id: 2)
MuppetShow.create(job: "Singer/Actor", muppet_id: 4, show_id: 2)
