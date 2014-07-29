class GamesController < ApplicationController


  def index
    @games = Game.all
  end

  def show
    @move = Move.new()
    @game = Game.find(params[:id])
    @current_user_symbol = "X"
    
    @xs = @game.moves.map{|x| x[:cell_chosen] if user_id = current_user.id }
    @xs.delete(nil)
    # @os = @game.moves.map{|x| x[:cell_chosen] if user_id != current_user.id }

    @numbers = [*1..9] 
    @numbers = @numbers - @xs #- @os


  end

  def new
  @game = Game.new
  end
  #current_user.current_game.move.new

  
  def create
    @game = Game.new(params[:game])
    if @game.save
    render :show
  end
  end

end



