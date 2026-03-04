Card.destroy_all

puts "All Cards destroyed!"

@quest = Quest.create!(user: User.last)
Chat.create!(quest: @quest)

puts "Start generate cards..."
Card.create(
  title: "Les Arcanes de l’Ordinateur",
  content: "Les mystères de l’informatique me dépassent. Je cherche un guide capable de m’expliquer simplement comment tout cela fonctionne.",
  category: "Mage",
  status: "false",
  quest: Quest.last,
  chat: @quest.chat,
)

Card.create(
  title: "L’Outil Oublié du Samedi",
  content: "Le jour du labeur approche et il me manque un râteau. Il faut en trouver un avant samedi, par l’échange ou l’emprunt.",
  category: "Guerrier",
  status: "false",
  quest: Quest.last,
  chat: @quest.chat,
)

Card.create(
  title: "Le Moteur Réduit au Silence",
  content: "Mon véhicule refuse d’avancer. Je dois trouver quelqu’un qui s’y connaît en mécanique pour m’aider à réparer la panne.",
  category: "Assassin",
  status: "false",
  quest: Quest.last,
  chat: @quest.chat,
)

puts "Finished! #{Card.count} generated"
