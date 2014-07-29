class Move < ActiveRecord::Base
  attr_accessible :cell_chosen, :game_id, :player_id

  belongs_to :user



end
