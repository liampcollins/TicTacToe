class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :cell_chosen 
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end
