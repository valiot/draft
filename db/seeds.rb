# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# e = Event.create(
#   name: "Disrupting Angels",
#   starts_at: "2016-06-1 20:00:00",
#   finishes_at: "2016-06-2 20:00:00"
# )

e = Event.find_by(slug: 'disrupting-xignux')

Team.create(
  name: "VIAKABLE 1",
  event_id: e.id,
  profiles: {
    "Hacker"=>1,
    "Data"=>2,
    "Designer"=>1,
    "Random"=>1
  }
)


Team.create(
  name: "QUALTIA 1",
  event_id: e.id,
  profiles: {
    "Hacker"=>1,
    "Maker"=>1,
    "Random"=>2,
    "Industrial Designer"=>1
  }
)


Team.create(
  name: "PROLEC GE 1",
  event_id: e.id,
  profiles: {
    "Hacker"=>2,
    "Maker"=>2,
    "IFI"=>1
  }
)

Team.create(
  name: "VIAKABLE 2",
  event_id: e.id,
  profiles: {
    "Hacker"=>2,
    "Data"=>2,
    "Designer"=>1
  }
)

Team.create(
  name: "QUALTIA 2",
  event_id: e.id,
  profiles: {
    "Hacker"=>1,
    "Maker"=>1,
    "Random"=>1,
    "Industrial Designer"=>2
  }
)

Team.create(
  name: "PROLEC GE 2",
  event_id: e.id,
  profiles: {
    "Hacker"=>1,
    "Maker"=>3,
    "IFI"=>1
  }
)
