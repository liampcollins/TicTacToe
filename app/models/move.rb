class Move < ActiveRecord::Base
  attr_accessible :cell_chosen, :game_id, :user_id

  belongs_to :user
  belongs_to :game

  
    



end
