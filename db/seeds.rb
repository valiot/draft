# Setup questions for review.

Question.create(
  question: 'Abierto a nuevas ideas (por mas locas que fueran), honesto y transparente al compartir información y dar su opinion.',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Dio el "extra mile", estuvo siempre comprometido con el equipo y demostró ser pro-activo en el desarrollo del proyecto.',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Se relacionó con todos los integrantes del equipo y trabajó en conjunto para lograr los objetivos del equipo, siempre con buena actitud.',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Se salió de su zona de confort y dio su máximo esfuerzo, aún si el proyecto fuera casi imposible de lograr.',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Aún con la presión encima demostró pasión y entusiasmo durante todo el evento',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Déjanos tus comentarios o sugerencias',
  q_type: :open,
  individual: false
)

# The profile hash must not include the leader of the team.

# e = Event.find_by(slug: 'disrupting-coflex')
#
# Team.create(
#   name: 'TENSION 1',
#   event_id: e.id,
#   profiles: { 'Maker' => 1, 'Non IT' => 1, 'Industrial Designer' => 1, 'Rockstars' => 1 }
# )
