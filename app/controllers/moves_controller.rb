class MovesController < ApplicationController
  def new
    @move = Move.new
  end

  def create
    # USER MOVE
    @move = Move.new(params[:move])
    @move.user_id = current_user.id

    if @move.save      
      @game = Game.find(@move[:game_id])
      if @game.winner?
        redirect_to :back, notice: "You've Won!"
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
          redirect_to :back
        end
        
      end
    end
  end



  def show
  end

end