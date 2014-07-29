class MovesController < ApplicationController
  def new
    @move = Move.new
  end

  def create
    #USER MOVE
    @move = Move.new(params[:move])

    @move.user_id = current_user.id

    if @move.save

      #COMPUTER MOVE
      @numbers = [*1..9]
      game = Game.find(@move[:game_id])

      moves_taken = game.moves.map do |x| 
        x[:cell_chosen] 
      end




      moves_left = @numbers - moves_taken
      
      random = moves_left.sample
      
      @move_comp = Move.new()
pp
      @move_comp.cell_chosen = random
      @move_comp.game_id = @move[:game_id]
      @move_comp.user_id = 0
      
      if @move_comp.save 
      
        redirect_to :back
      end
    end
    def show
    end
  end
end