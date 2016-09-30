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

e = Event.find_by(slug: 'disrupting-katcon')

Team.create(
  name: "SOLDADURA 1",
  event_id: e.id,
  profiles: { "Hacker"=>2, "Maker"=>1, "Random"=>1, "IFI"=>1 }
)


Team.create(
  name: "SOLDADURA 2",
  event_id: e.id,
  profiles: { "Hacker"=>2, "Data"=>1, "Non IT"=>1, "Random"=>1 }
)

Team.create(
  name: "ANNULUS 1",
  event_id: e.id,
  profiles: { "Hacker"=>1, "Industrial Designer"=>1, "Math"=>1, "Random"=>1, "Maker"=>1}
)

Team.create(
  name: "ANNULUS 2",
  event_id: e.id,
  profiles: { "Hacker"=>1, "Maker"=>1, "Industrial Designer"=>1, "Random"=>1, "Math"=>1 }
)

Team.create(
  name: "CICLO 1",
  event_id: e.id,
  profiles: { "Hacker"=>1, "Maker"=>1, "Non IT"=>1, "Data"=>1, "Random"=>1 }
)

Team.create(
  name: "CICLO 2",
  event_id: e.id,
  profiles: { "Hacker"=>2, "Maker"=>1, "Non IT"=>1, "Random"=>1}
)
