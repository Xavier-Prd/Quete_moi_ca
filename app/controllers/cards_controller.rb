class CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
    @card_user = @card.quest.user
  end
end
