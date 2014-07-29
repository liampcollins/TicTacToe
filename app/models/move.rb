class Move < ActiveRecord::Base
  attr_accessible :cell_chosen, :game_id, :player_id

  belongs_to :user
  belongs_to :game

  
    


  def winner (g_id)
    @moves_taken = Move.all.map do |x| 
      x[:cell_chosen] if game_id = g_id && user_id = current_user.id
    end
    @winning_arrays  [[1, 2, 3], [1, 4, 7], [2, 5, 8], [3, 6, 9], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7]]
    @winning_arrays.each do |winning_array|
      if (winning_array & @moves_taken) == winning_array
        return true
      else
        false
      end
    end
  end
  



end
