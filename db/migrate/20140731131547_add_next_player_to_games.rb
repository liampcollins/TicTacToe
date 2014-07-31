class AddNextPlayerToGames < ActiveRecord::Migration
  def change
    add_column :games, :next_player, :integer
  end
end
