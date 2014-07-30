class Game < ActiveRecord::Base
  attr_accessible :first_move, :player1, :player2, :winner

  has_many :users
  has_many :moves

  # def gameover?
  #   # Check if there is a winner? -returns true if game is over

  #   # -if no: Check if there are any moves left
  #   # -returns true if game is over

  #   # Create an array of the current user's moves values within game 
  #   # Look at win conditions (represented as an multi-dimensional array of win positions)
  #   # Loop through winning combinations to see if they match with user's moves

  #   # returns false if not and then 
  #   ## work out who is going to play (user/computer)
  #   ## If user....
  #   ## If computer -> Make a computers move.
  #   ## Check gameover?
  # end

    ## Computer Move Method logic
  def computer_move
    numbers = [*1..9]
    
    moves_taken = moves.map do |move| 
      move[:cell_chosen] 
    end

    moves_left = numbers - moves_taken
    random = moves_left.sample
    
    move_comp = moves.new()
    move_comp.cell_chosen = random
    # @move_comp.game_id = @move[:game_id]
    move_comp.user_id = 0

    move_comp

  end

  def winner?
    last_player_id = moves.last.user_id
    moves_in_game = moves.map do |move|
      move.cell_chosen if move.user_id == last_player_id
    end

    winning_arrays = [
      [1, 2, 3], 
      [1, 4, 7], 
      [2, 5, 8], 
      [3, 6, 9], 
      [4, 5, 6], 
      [7, 8, 9], 
      [1, 5, 9], 
      [3, 5, 7]
    ]
    
    result = false
    winning_arrays.each do |winning_array|
      # If the moves contains wins array
      
      if (winning_array & moves_in_game) == winning_array
        result = true
      end
    end
    result
  end

  def no_winner?
    moves_taken = moves.map do |move| 
    move[:cell_chosen] 
    end
    moves_taken.delete(nil)
    if moves_taken.length >8
      return true
    else
      return false
    end
    moves_left = numbers - moves_taken
  end
end
