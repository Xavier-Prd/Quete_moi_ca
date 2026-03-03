class CreateCards < ActiveRecord::Migration[8.1]
  def change
    create_table :cards do |t|
      t.references :chat, null: false, foreign_key: true
      t.references :quest, null: false, foreign_key: true
      t.string :title
      t.string :content
      t.string :status
      t.string :category

      t.timestamps
    end
  end
end
