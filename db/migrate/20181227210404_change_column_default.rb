class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :turns, :term, (2019/01)
  end
end
