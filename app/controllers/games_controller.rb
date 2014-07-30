class GamesController < ApplicationController


  def index
    @games = Game.all
    @game = Game.new
  end

  def show
    @move = Move.new()
    @game = Game.find(params[:id])
    @numbers = [*1..9] 
    
    @xs = @game.moves.where(user_id: current_user.id).map { |move|  move.cell_chosen}
    @os = @game.moves.where(user_id: 0).map { |move|  move.cell_chosen}

  #Replace elements in numbers that are present in xs with X
    @xs.each do |x|
      if @numbers.include?(x)
        index = @numbers.index(x)
        @numbers.delete_at(index)
        @numbers.insert(index, "X")
      end
    end

  #Replace elements in numbers that are present in os with O
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



