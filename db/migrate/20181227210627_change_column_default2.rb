class ChangeColumnDefault2 < ActiveRecord::Migration[5.2]
  def change
    change_column_default :turns, :term, 2000/01/02
  end
end
