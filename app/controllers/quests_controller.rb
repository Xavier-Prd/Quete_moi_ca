class QuestsController < ApplicationController
  def show
    @quest = Quest.find(params[:id])
    @chat = @quest.chat
    @message = Message.new
    # @chat = @quest.chats.where(user: current_user)
    # @card = @chat.cards.last # ??
  end

  def index
    @quests = Quest.all
  end

  def create
    @quest = Quest.new
    @quest.user = current_user
    Chat.create!(quest: @quest)
    if @quest.save
      redirect_to @quest
    else
      render "/quests", status: :unprocessable_entity
    end
  end
end
