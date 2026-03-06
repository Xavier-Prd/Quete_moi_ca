class AddCardToMessages < ActiveRecord::Migration[8.1]
  def change
    add_reference :messages, :card, foreign_key: true
  end
end
