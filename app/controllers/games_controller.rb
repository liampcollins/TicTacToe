class GamesController < ApplicationController


  def index
    @games = Game.all
    @game = Game.new
  end

  def show
    @move = Move.new()
    @game = Game.find(params[:id])
    # @game.moves.where(user_id == current_user_id)
    @numbers = [*1..9] 
    #
    @xs = @game.moves.map do |x| 
      x[:cell_chosen] if x[:user_id] == current_user.id 
    end
    @xs.delete(nil)


    @os = @game.moves.map do |x| 
      x[:cell_chosen] if x[:user_id] == 0 
    end
    @os.delete(nil)

    

        # @numbers = @numbers - @xs - @os

  #Replace elements in numbers that are present in xs with X
    @xs.each do |x|
      if @numbers.include?(x)
        index = @numbers.index(x)
        @numbers.delete_at(index)
        @numbers.insert(index, "X")
      end
    end
    puts @numbers
  

 

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

    render :show
  end
  end

end



