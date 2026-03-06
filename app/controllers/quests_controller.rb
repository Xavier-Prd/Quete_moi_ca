class QuestsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :check_owner, only: :show
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

  private

  def check_owner
    @quest = Quest.find(params[:id])
    redirect_to quests_path, alert: "Accès refusé" unless current_user.id == @quest.user.id
  end
end
