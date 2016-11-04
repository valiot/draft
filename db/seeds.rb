# The profile hash must not include the leader of the team.

e = Event.find_by(slug: 'disrupting-farmacias-del-ahorro')

Team.create(
  name: 'Servicio Orientación Medica 1',
  event_id: e.id,
  profiles: { 'Data' => 2, 'Designer' => 1, 'Hacker' => 1, 'Rockstar' => 1 }
)


Team.create(
  name: 'Servicio Orientación Medica 2',
  event_id: e.id,
  profiles: { 'Hacker' => 2, 'Data' => 1, 'Designer' => 1, 'Rockstar' => 1 }
)

Team.create(
  name: 'Servicio a Domicilio 1',
  event_id: e.id,
  profiles: { 'Hacker' => 1, 'Non IT' => 1, 'Data' => 1, 'Rockstar' => 1, 'Designer' => 1}
)

Team.create(
  name: 'Servicio a Domicilio 2',
  event_id: e.id,
  profiles: { 'Hacker' => 1, 'Maker' => 1, 'Data' => 1, 'Rockstar' => 1, 'Designer' => 1}
)

# Team.create(
#   name: 'CICLO 1',
#   event_id: e.id,
#   profiles: { 'Hacker' => 1, 'Non IT' => 1, 'Data' => 1, 'Rockstar' => 1 }
# )
#
# Team.create(
#   name: 'CICLO 2',
#   event_id: e.id,
#   profiles: { 'Hacker' => 1, 'Maker' => 1, 'Non IT' => 1, 'Rockstar' => 1}
# )
