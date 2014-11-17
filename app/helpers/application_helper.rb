module ApplicationHelper
	#this is where the User's selection - 'busnum' will be compared with the API data - 'results'.
		def hash_and_msg_generator(results, busnum)
			#we will have a couple messages to tell the user whether or not the bus number is valid.
			@message = ""
			#we want to provide the user with the name of the next stop for their bus. The best way to save two related items is a hash!
			# @nextstop = {}
			@results.each do |result|
				if result["VEHICLE"] == busnum.to_s
					#if the User's bus number matching an active bus in the API data, we will save that info in our hash
					@nextstop = result["TIMEPOINT"]
					#the Route is the key and the next stop is the value
					@message = "Your next stop will be:"
					break
				else
					@message = "I'm sorry, but that isn't an active bus. Please try again."
				end
			end
		end
end
