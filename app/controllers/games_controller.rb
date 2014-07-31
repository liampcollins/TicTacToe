class GamesController < ApplicationController


  def index
    @games = Game.all
    @game = Game.new
  end

  def show
    @move = Move.new()
    @game = Game.find(params[:id])
    @next_to_move_id = 1
    # @next_to_move_id = @game.next_player


    #IF USER HAS SELECTED @ PLAYER BUT BOTH PLAYERS NOT SELECTED REDIRECT

    if @game.player1
      if @game.player2 
      else
        redirect_to new_game_path, notice: "You must select 2 players to play a 2-player game"
      end
    end


    # if @game.player2?
    # else
    #   if current_user
    #     @game.player1 = current_user.id
    #   else
    #     @game.player1 = 0
    #   end
    #   @game.player2 = 0
    # end


# DEFINING @NUMBERS ARRAY WHICH HOLDS AVAILABLE SPACES, Xs and Ox.
    @numbers = [*1..9]
    @xs = @game.moves.where(user_id: @game.player1).map { |move|  move.cell_chosen}
    @os = @game.moves.where(user_id: @game.player2).map { |move|  move.cell_chosen}
    #Replace elements in @numbers that are present in xs with X
    @xs.each do |x|
      if @numbers.include?(x)
        index = @numbers.index(x)
        @numbers.delete_at(index)
        @numbers.insert(index, "X")
      end
    end
    #Replace elements in @numbers that are present in os with O
    @os.each do |o|
      if @numbers.include?(o)
        index = @numbers.index(o)
        @numbers.delete_at(index)
        @numbers.insert(index, "O")
      end
    end 
  end




  def new
  
  @game = Game.new
  end
  #current_user.current_game.move.new





  def create
    @game = Game.new(params[:game])
    if @game.save
      @numbers = [*1..9] 
      @move = Move.new()

    redirect_to @game
    end
  end
end



