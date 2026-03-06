class CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
    @card_user = @card.quest.user
  end

  def activate
    @card = Card.find(params[:id])
    Card.where(chat_id: @card.chat_id).update_all(status: "inactive")
    @card.update(status: "active")
  end
end
