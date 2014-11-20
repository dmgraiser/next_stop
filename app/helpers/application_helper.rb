module ApplicationHelper
	#this is where the User's selection - 'busnum' will be compared with the API data - 'results'.
		def hash_and_msg_generator(results, busnum)
			#we will have a couple messages to tell the user whether or not the bus number is valid.
			@message = ""
			#we want to provide the user with the name of the next stop for their bus by calling the TIMEPOINT where the VEHICLE number matches the user's input.
			@results.each do |result|
				
				if result["VEHICLE"] == busnum.to_s
					#if the User's bus number matching an active bus in the API data, we will rename @nextstop
					@nextstop = result["TIMEPOINT"]

					# @active_busses = result["VEHICLE"]
					
					@message = "Your next stop will be:"
					#break needed to keep the loop from continuing throught the rest of the data
					break
				else
					#user's input doesn't match any active busses
					@message = "I'm sorry, but that isn't an active bus. Please try again."
				end

			end
		end

		def bus_on_road
			
			@active_busses = []
			@results.each do |bus_info|
				@active_busses.push(bus_info["VEHICLE"])
			end

		end
end
