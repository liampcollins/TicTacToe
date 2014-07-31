class MovesController < ApplicationController
  def new
    @move = Move.new
  end

  def create
    # USER MOVE
    @move = Move.new(params[:move])
    
    
    @game = Game.find(@move[:game_id])
    if @game.player2
      ids = [@game.player1, @game.player2]
      #Assign who just took the move with a playing_player variable
      #If no move.last then player 1, else call reverse function on
      if @game.moves.length == 0

        playing_player_id = @game.player1
        @move.user_id = playing_player_id

      else
        puts "not the first move"
        playing_player_id = @game.player_swap
        @move.user_id = playing_player_id
      end

    else
      @player1 = current_user.id
      @move.user_id = @player1
    end

    if @move.save 
      puts "-"*80
      puts "move saved"
      puts @move.user_id

      if @game.player2
        puts "-"*80
        puts "2 player game"

        if @game.game_winner?
          @game.winner = @move.user_id
          @game.save
          redirect_to :back, notice: "You've Won #{@move.user.username}! "
        elsif @game.no_winner?
          redirect_to :back, notice: "No Winner"
        else
            other = User.find(ids - [@move.user_id])
            redirect_to :back, notice: "Your turn #{other.last.username}"
        end
      else
        if @game.game_winner?
          @game.winner = @move.user_id
          @game.save
          redirect_to :back, notice: "You've Won #{@move.user.username}! "
        elsif @game.no_winner?
          redirect_to :back, notice: "No Winner"  
        else
        @move_comp = @game.computer_move 
        @move_comp.save
          if @game.winner?
            redirect_to :back, notice: "You Lose!"
          elsif @game.no_winner?
            redirect_to :back, notice: "No Winner"
          else 
            redirect_to :back, notice: "Your turn #{current_user.email}"
          end
        end
      end
    end
  end



  def show
  end

end