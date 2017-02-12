require_relative "draw_board.rb"

require_relative "logic.rb"



class Main_Control<Logic_Flow
	@@control="first"
	
	@@first=:"x"
	@@second=:"0"
	def initialize 
		
		puts("Welcome this is a 2 player game(tic-tac-toe) ")
		puts("Players please enter what dimension board you want")
		sizee=gets()
		sizee=sizee.to_i
		@@size=sizee
		super(@@size)
		puts("This is a turn by turn game")
		puts("Player 1 with symbol-x moves first")
		draw(sizee)
		
	end	
	def move
	  x=1	
	  @@win=false
	  while x<=(@@size*@@size)
		puts("\nplayer #{@@control} make a move")
		puts("choose your cell where you want to mark your symbol")
		puts("enter your row number please  (rows are 1 to #{@@size} from left)")
		row=gets.to_i
		puts("enter your column number please  (rows are 1 to #{@@size}) from top")
		col=gets.to_i
		range_validity=check_range(row,col)
		#puts("range validityy=",range_validity)
	    if(range_validity==true)
		if(@@control=="first")
		   @@control="second"

		   @@win=(logic(row,col,"x"))
		   if(@@win==true)
			@@control="first"
			break
		    end
		else
		   @@control="first"

		   @@win=(logic(row,col,"0"))
		      if(@@win==true)
			@@control="second"
			break
		       end
		end
	       x=x+1
	       
	     else
		 puts("improper cell selected...not legitimate range...retry")
		 
	     end
	   end
		
	     if(@@win==true)	
		i=1;
		until(i==45)
		  print"*"
		  i+=1
		end
		puts"\n"
		i=1
		until(i==45)
		  print"*"
		  i+=1
		end
		  puts("\nplayer #{@@control}  has  won the game\n")
		  
		i=1
		print"\n"
		until(i==45)
		  print"*"
		  i+=1
		end
		i=1
		puts"\n"
		until(i==45)
		  print"*"
		  i+=1
		end
	    end	
	end
end		
m=Main_Control.new
m.move
