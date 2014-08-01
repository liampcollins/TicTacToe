class GamesController < ApplicationController

  # Home Page for games
  def index
    @games = Game.all
    @game = Game.new
  end

  # Show 1 game
  def show
    @move = Move.new()
    @game = Game.find(params[:id])

    if @game.moves.length == 0
      if @game.first_move == 1
        @game.next_player = @game.player1
      elsif @game.first_move == 2
        @game.next_player = @game.player2
      end
    end

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


  # Post
  def create
    @game = Game.new(params[:game])

    if @game.player1 == @game.player2
     redirect_to new_game_path, notice: "You can't play a 2-player against yourself!!"
     
    elsif !@game.player2
      redirect_to new_game_path, notice: "You need to pick a player to play against!!"

    elsif @game.save
      @numbers = [*1..9] 
      @move = Move.new()
      redirect_to @game
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to root_path
  end

end



