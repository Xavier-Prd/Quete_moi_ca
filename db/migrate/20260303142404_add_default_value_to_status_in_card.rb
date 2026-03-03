class AddDefaultValueToStatusInCard < ActiveRecord::Migration[8.1]
  def change
    change_column_default(:cards, :status, "inactive")
  end
end
