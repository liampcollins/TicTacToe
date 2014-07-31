class MovesController < ApplicationController
  def new
    @move = Move.new
  end

  def create

    @move = Move.new(params[:move]) 
    @game = Game.find(@move[:game_id])

    if @move.save       
      if @game.player2 != 0
        @game = @game.check_2_player_game_status
        redirect_to :back 
      else 
        # NEEDS TO BE REFACTORED
        if @game.game_winner?
          @game.winner = @move.user_id
          @game.save
          redirect_to :back, notice: "You've Won...well you've lost, but you win! "
        elsif @game.no_winner?
          redirect_to :back, notice: "No Winner"  
        else
          
        @move_comp = @game.computer_move 
        @move_comp.save
          if @game.game_winner?
            @game.save
            redirect_to :back, notice: "You've Lost...well you've won, but you lose! "
          elsif @game.no_winner?
            redirect_to :back, notice: "No Winner"
          else
             redirect_to :back, notice: "Your turn"

          end
        end
      end
    end
  end



  def show
  end

end