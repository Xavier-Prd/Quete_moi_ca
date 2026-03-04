class MessagesController < ApplicationController
  before_action :set_chat, :set_quest

  SYSTEM_PROMPT = <<~PROMPT
    Tu es un donneur de quête dans un univers fantasy appliqué à une ville moderne réelle.

    Ta mission est de transformer chaque demande que tu reçois en une quête immersive et compréhensible, centrée sur **un seul habitant**.

    Règles obligatoires :

    - La demande d’origine doit rester clairement compréhensible et identifiable dans la quête.
    - Les demandes sont formulées par un seul habitant (commerçant, étudiant, voisin, employé, responsable associatif, etc.).
    - La quête doit être rédigée comme si **cet habitant s’adressait directement à l’aventurier**, pour son propre besoin.
    - Le ton doit être fantasy : inventif, immersif, avec un style RPG. Tu peux inclure de la magie, des créatures ou des objets magiques si cela enrichit la quête, mais ce n’est pas obligatoire.
    - Le champ "content" doit contenir environ 2 phrases, claires et concises.
    - Les objectifs doivent être explicitement formulés pour que le lecteur comprenne exactement ce qu’il doit accomplir.
    - Les actions doivent rester **réalistes ou réalisables** dans le cadre d’une ville moderne, même si la fantaisie est présente.
    - Tu dois répondre uniquement en JSON valide.
    - Le JSON doit contenir exactement trois clés :
        - "titre" : le titre de la quête.
        - "content" : la demande transformée en quête fantasy urbaine centrée sur un habitant.
        - "category" : le type de quête, qui doit être uniquement l’un des suivants :
            - "mage" → réflexion, apprentissage, stratégie, organisation.
            - "warrior" → action, effort physique, discipline, confrontation.
            - "rogue" → ruse, optimisation, créativité, débrouillardise.

    Ne renvoie aucun texte en dehors du JSON.
    Ne rajoute aucune explication.
  PROMPT
  def create
    @message = Message.new(message_params)
    @message.role = "user"
    @message.chat = @chat
    if @message.save
      response_json = RubyLLM.chat.with_instructions(SYSTEM_PROMPT).ask(@message.content)
      Message.create!(content: response_json, role: "assistant", chat: @chat)
      response = JSON.parse(response_json)
      @card = Card.create!(title: response[title], content: response[content], category: response[category])
      redirect_to @quest
    else
      render "quests/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def set_quest
    @quest = Quest.find(params[:quest_id])
  end
end
