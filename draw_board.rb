class Draw_board
	def initialize 
	@@t1=[]
	@@t2=[]	
	@@final=Array.new

	end


       def check_range (r,c)
	
	 status=true
		 already_stored_x=-1
		 already_stored_x=-1
	      if((r>0 && r<=@length)&&(c>0 &&c<=@length))
		   @@final.each do |v|
						
				v.each do |key,val|
					if(key==:x)
					  already_stored_x=val
					end
					if (key==:y)
					  already_stored_y=val	
					end		

					if((already_stored_x==r)&&(already_stored_y==c))
						status=false
						return status
					end
				end
			 
		    end
	      else
		  status=false
		  return status
	      end
	return status
	end
	def draw(length,xcord=-1,ycord=-1,symbol="")
	   @symbol=symbol
	   @length=length
	   draw_zero_list_array=Array.new
	   draw_x_list_array=Array.new
	   if(xcord!=-1&&ycord!=-1)
	     temp_hash=Hash.new
	     temp_hash={:x=>xcord,:y=>ycord,:symbol=>@symbol}
	      if @symbol=="0"	 
		 @@t1.push(temp_hash)
		 @now=@@t1
		@@final.push(temp_hash)
	      else 
		 @@t2.push(temp_hash)
		 @now=@@t2
		@@final.push(temp_hash)
              end
	   end
	   
	  
	   print("\n\n")

	  if(xcord==-1 && ycord==-1)
	     m=1

	     while(m<=length)
		   i=1		
		   print("\n")
		   print("   ")
		   while(i<=length)
		     print("_____")	
		     i+=1
	           end
		   x=1		
		   print("\n")
		   print("   |")
		   until(x==length+1)
		     print("   |")
		    
		     x=x+1
		   end
		   x=1
		   print("\n")
		   print("   |")
		   until(x==length+1)
		     print("   |")
		     
		     x=x+1
	  	   end
	       m=m+1
	      end
	    i=1;
	    print("\n   ")
	    while(i<=length)
		  print("_____")	
		  i+=1
	    end
	  else
	  ####    
		
		   y=1
		   while(y<=length)
		       i=1		
		       print("\n")
		       print("   ")
		     while(i<=length)
		         print("_____")	
		         i+=1
	             end
		     x=1	
		  
		     print("\n")
		     print("   |")
		     test1=""
		     test2=""
		      test3=""
		     while(x<=length)
			flag=0

			 @@final.each do |v3|
			     v3.each do |m,n|
				   #print "lets see m and n\t",m,n
				   if(m==:x)
				      test1=n
				   end
				   if(m==:y)
					test2=n
				   end
				   if(m==:symbol)
					test3=n
				    end
				end  
			 
		            if ((y==test1) && (test2==x))	
		               print("  #{test3}|")
		               flag=1

			     end
			  end 
			    
			     
		         
			if(flag==0)
				print("   |")
			end
		         x=x+1
		     end
		     x=1
		     print("\n")
		     print("   |")
		     until(x==length+1)
		       print("   |")
		       
		       x=x+1
	  	     end
	            y=y+1
	           end
	      i=1;
	      print("\n   ")
	      while(i<=length)
		  print("_____")	
		  i+=1
	      end


	    end
	end
 
end
		

