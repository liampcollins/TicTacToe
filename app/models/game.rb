class Game < ActiveRecord::Base
  attr_accessible :first_move, :player1, :player2, :winner

  has_many :users
  has_many :moves, through: :users
end
