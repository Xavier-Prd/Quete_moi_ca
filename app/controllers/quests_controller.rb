class QuestsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def show
    @quest = Quest.find(params[:id])
    @message = Message.new
    @quest.chat
    @card = @quest.cards.last # ??
  end

  def index
    @quests = Quest.all
    @cards = Card.all
  end

  def explore
    @quests = Quest.all
    @cards = Card.all
  end

  def create
    @quest = Quest.new
    @quest.user = current_user
    Chat.create!(quest: @quest)
    @quest.chat.messages.create!(role: "assistant", content: "Bonjour villageois, de quoi as-tu besoin aujourd'hui ?")
    if @quest.save
      redirect_to @quest
    else
      render "/quests", status: :unprocessable_entity
    end
  end
end
