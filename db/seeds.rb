# The profile hash must not include the leader of the team.

e = Event.find_by(slug: 'disrupting-coflex')

Team.create(
  name: 'TENSIÓN 1',
  event_id: e.id,
  profiles: { 'Maker' => 1, 'Non IT' => 1, 'Industrial Designer' => 1, 'Rockstar' => 1 }
)

Team.create(
  name: 'TENSIÓN 2',
  event_id: e.id,
  profiles: { 'Maker' => 1, 'Non IT' => 1, 'Industrial Designer' => 1, 'Rockstar' => 1 }
)

Team.create(
  name: 'LOGISTICA 1',
  event_id: e.id,
  profiles: { 'Hacker' => 1, 'Data' => 1, 'Designer' => 1, 'Rockstar' => 1 }
)
Team.create(
  name: 'LOGISTICA 2',
  event_id: e.id,
  profiles: { 'Hacker' => 1, 'Data' => 1, 'Non IT' => 1, 'Rockstar' => 1 }
)

Team.create(
  name: 'SAPO 1',
  event_id: e.id,
  profiles: { 'Maker' => 2, 'Industrial Designer' => 1, 'Rockstar' => 1 }
)

Team.create(
  name: 'SAPO 2',
  event_id: e.id,
  profiles: { 'Maker' => 1, 'IFI' => 1, 'Industrial Designer' => 1, 'Rockstar' => 1 }
)
