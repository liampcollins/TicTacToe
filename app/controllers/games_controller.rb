class GamesController < ApplicationController


  def index
  #LEADER BOARD TABLE
  end

  def show
    @move = Move.new()
    @game = Game.find(params[:id])
    @current_user_symbol = "X"
  end

  def new
  @game = Game.new
  end
  #current_user.current_game.move.new

  def new_move
    @move = Move.new
  end


  def create
    @move_made = params[:move_made]
    game.current_user.move.cell_chosen = @move_made
  end

end



