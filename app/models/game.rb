class Game < ActiveRecord::Base
  attr_accessible :first_move, :player1, :player2, :winner

  has_many :moves


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

  def game_winner?

    last_player_id = moves.all.last.user_id
    moves_in_game = moves.all.map do |move|
      if move.user_id == last_player_id
        puts "cell chosen"
        puts move.cell_chosen
        puts "-"*80
        move.cell_chosen
      end
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
    
    @result = false
    winning_arrays.each do |winning_array|
      # If the moves contains wins array

      if (winning_array & moves_in_game) == winning_array
        @result = true

      end

    end
    
    @result
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

  def swap_player
    ids = [player1, player2]
    next_player = (ids - [moves.last.user_id]).last
    next_player
  end

  def check_2_player_game_status
    if game_winner?
      self.winner = moves.last.user_id
    end
    self.next_player = swap_player
    self.save
    self
  end
end 



















