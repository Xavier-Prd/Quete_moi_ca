Card.destroy_all

puts "All Cards destroyed!"

Quest.create!(user: User.last)

puts "Start generate cards..."
Card.create(
  title: "Les Arcanes de l’Ordinateur",
  content: "Les mystères de l’informatique me dépassent. Je cherche un guide capable de m’expliquer simplement comment tout cela fonctionne.",
  category: "Mage",
  status: "false",
  quest: Quest.last,
  chat: Quest.chat,
)

Card.create(
  title: "L’Outil Oublié du Samedi",
  content: "Les mystères de l’informatique me dépassent. Je cherche un guide capable de m’expliquer simplement comment tout cela fonctionne.",
  category: "Guerrier",
  status: "false",
  quest: Quest.last,
  chat: Quest.chat,
)

Card.create(
  title: "Le Moteur Réduit au Silence",
  content: "Mon véhicule refuse d’avancer. Je dois trouver quelqu’un qui s’y connaît en mécanique pour m’aider à réparer la panne.",
  category: "Assassin",
  status: "false",
  quest: Quest.last,
  chat: Quest.chat,
)

puts "Finished! #{Card.count} generated"
