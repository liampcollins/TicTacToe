module GamesHelper

#FIRST USER METHOD TBC
def first_mover
   guest = "guest" 
   if current_user.id == @next_to_move_id 
     if @game.moves.length == 0 
       if @game.first_move == 1 
         if @game.player1 > 0
           player = User.find(@game.player1) 
           first_mover = player.username       
         else 
           first_mover = guest 
         end 
       elsif @game.first_move == 2  
         if @game.player1 > 0 
           player = User.find(@game.player1) 
           first_mover = player.username       
         else 
           first_mover = guest 
         end 
       else 
       first_mover = guest 
       end 
     end 
   end
   first_mover
  end 
end
