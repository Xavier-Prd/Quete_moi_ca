class CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
    @card_user = @card.quest.user

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("card_frame", partial: "card", locals: { card: @card })
      end
      format.html
    end
  end

  def activate
    @card = Card.find(params[:id])
    Card.where(chat_id: @card.chat_id).update_all(status: "inactive")
    @card.update(status: "active")
    redirect_to quests_path
  end
end
