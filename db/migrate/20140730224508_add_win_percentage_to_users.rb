class AddWinPercentageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :win_precentage, :float
  end
end
