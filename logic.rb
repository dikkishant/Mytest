class Logic_Flow<Draw_board
	def initialize len
		super()
		@len=len
		@@zero_list_array=Array.new
		@@x_list_array=Array.new
		@@zero_list_node=Hash.new
		@@x_list_node=Hash.new
		
		@row_check_x=Array.new

		@col_check_x=Array.new
		@diagonal_main_check_x=Array.new

		@row_check_0=Array.new

		@col_check_0=Array.new
		@diagonal_main_check_0=Array.new
		@diagonal_secondary_check_0=Array.new
		@diagonal_secondary_check_x=Array.new
		

	end
	def logic (row,col,symbol)
		

		row=row.to_i		
		col=col.to_i		
		@row_check_0.clear
		@col_check_0.clear
		
		@row_check_x.clear
		@col_check_x.clear


   		if symbol=="0"
			@@zero_list_node={:x=>row,:y=>col}
		        draw(@len,row,col,"0")
			@@zero_list_array.push(@@zero_list_node)
			m=check_success(row,col,symbol)
			
			
			return m
  		 else
			
			@@x_list_node={:x=>row,:y=>col}
			draw(@len,row,col,"x")
			@@x_list_array.push(@@x_list_node)
					
			m=check_success(row,col,symbol)
			
			return m
  		 end
	end
	
     


	def check_success(row,col,symbol)
		
		if symbol=="0"
		m1=-1
		m2=-111
			
			@@zero_list_array.each do |v|
				v.each do |key,val|
					if(key==:x && val==row)
						m1=val
						@row_check_0.push(v[:y])

					end
					if(key==:y && val==col)
						m2=val
						@col_check_0.push(v[:x])

					end
					
				end
				if(m1==m2)

						@diagonal_main_check_0.push(m1)
				end
				if(m2==(@len-(m1-1)))
					@diagonal_secondary_check_0.push(m1)
				end
			end
		
		else
			m1=-1
			m2=-111
			@@x_list_array.each do |v1|
				v1.each do |key,val|
					
					if(key==:x && val==row)
						m1=val
						@row_check_x.push(v1[:y])
						
					end
					if(key==:y && val==col)
						m2=val
						@col_check_x.push(v1[:x])
						
					end
					
				end
				if(m1==m2)
					
					@diagonal_main_check_x.push(m1)
				end
				if(m2==(@len-(m1-1)))
					@diagonal_secondary_check_x.push(m1)
				end
			end
		end
		
	   if(symbol=="0")

		@row_check_0.sort!

		
		
		
		@col_check_0.sort!
		@diagonal_main_check_0.sort!
		@diagonal_secondary_check_0.sort!
		counter=1
		flag=1
		@win=false
		
		while(counter<=@len)
		   if(@row_check_0[counter-1].to_i)
			if(counter!=@row_check_0[counter-1])

			  flag=0

			  
			end
		   else
			flag=0
			break
		   end
		  counter+=1
		end	
		if(flag==1)
		  @win=true
		  return @win
		end

		counter=1 
		 flag=1
		while(counter<=@len)
		   if(@col_check_0[counter-1])
			if(counter!=@col_check_0[counter-1])
			  flag=0
			  break
			end
		   else
			flag=0
			break
		   end
		  counter+=1
		end	
		if(flag==1)
		
		  @win=true
		  return @win
		end
		
		counter=1 
		 flag=1
		while(counter<=@len)
		   if(@diagonal_main_check_0[counter-1])
			if(counter!=@diagonal_main_check_0[counter-1])
			  flag=0
			  break
			end
		   else
			flag=0
			break
		   end
		  counter+=1
		end	
		if(flag==1)
		  @win=true
		  return @win
		end
		counter=1 
		flag=1
		while(counter<=@len)
		   if(@diagonal_secondary_check_0[counter-1])
			if(counter!=@diagonal_secondary_check_0[counter-1])
			  flag=0
			  break
			end
		   else
			flag=0
			break
		   end
		  counter+=1
		end	
		if(flag==1)
		  @win=true
		  return @win
		end		
			
		return @win
	  
	  else
		@row_check_x.sort!
		
		
		@diagonal_secondary_check_x.sort!
		@col_check_x.sort!
		@diagonal_main_check_x.sort!
		counter=1
		flag=1
		@win=false
		
		while(counter<=@len)
		   if(@row_check_x[counter-1])
			if(counter!=@row_check_x[counter-1].to_i)
			  
			  flag=0

			  break
			end
		   else
			flag=0
			break
		   end
		  counter+=1
		end	
		if(flag==1)
		  @win=true
		  return @win
		end

		counter=1 
		 flag=1
		while(counter<=@len)
		   if(@col_check_x[counter-1].to_i)
			if(counter!=@col_check_x[counter-1].to_i)
			  flag=0
			  break
			end
		   else
			flag=0
			break
		   end
		  counter+=1
		end	
		if(flag==1)

		  @win=true
		  return @win
		end
		
		counter=1 
		 flag=1
		while(counter<=@len)
		   if(@diagonal_main_check_x[counter-1].to_i)
			if(counter!=@diagonal_main_check_x[counter-1].to_i)
			  flag=0
			  break
			end
		   else
			flag=0
			break
		   end
		  counter+=1
		end	
		if(flag==1)
		  @win=true
		  return @win
		end
		counter=1 
		flag=1
		while(counter<=@len)
		   if(@diagonal_secondary_check_x[counter-1].to_i)
			if(counter!=@diagonal_secondary_check_x[counter-1].to_i)
			  flag=0
			  break
			end
		   else
			flag=0
			break
		   end
		  counter+=1
		end	
		if(flag==1)
		  @win=true
		  return @win
		end		
			
		return @win
	  end	
	end
end




