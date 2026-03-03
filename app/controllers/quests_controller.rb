class QuestsController < ApplicationController
  def show
    @quest = Quest.find(params[:id])
    @chat = @quest.chats.where(user: current_user)
    @card = @chat.cards.last # ??
  end

  def index
    @quests = Quest.all
  end

  def create
    @quest = Quest.new
    # @chat = Chat.new
    # @card = Card.new
    if @quest.save
      redirect_to "/quests/:id"
    else
      render "quests", status: :unprocessable_entity
    end
  end
end
