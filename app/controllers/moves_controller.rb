class MovesController < ApplicationController


  def new
    @move = Move.new
  end

  def create
    @move = Move.new(params[:move])
    if @move.save
      #
      
      
      redirect_to :back
    end
  end
end