def timer(limit)
	
    while limit != 0
		sleep  1
        limit -= 1
        message = "Count down: #{limit}s."
        sleep 1
        print "\b" * message.length
        print message
        limit -= 1
        if (limit < 10)
            print "\b" * (message.length + 1)
        else 
            print "\b" * message.length 
        end
		print message
	end
    puts "Times up!"
end

timer 20