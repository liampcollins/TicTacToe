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
      @moves_taken = Move.all.map{|x| x[:cell_chosen] if game_id = @move[:game_id] }
      dd
      @moves_left = @numbers - @moves_taken
      
      @random = @moves_left.sample
      
      @move_comp = Move.new()
      @move_comp.cell_chosen = @random
      @move_comp.game_id = @move[:game_id]
      
      if @move_comp.save 
      
        redirect_to :back
      end
    end
    def show
    end
  end
end