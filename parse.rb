class ParseIt

	def intake
		@values = Hash.new	
		File.open('config.txt').each do |line|
			unless line[0] == "#"
				value_name = line.split('=')[0].chomp
				value_name.strip!
				value = line.split('=')[1].chomp
				value.strip!
				@values["#{value_name}"] = value
			end
		end
		prompt_user
	end

	def prompt_user
		puts "What param would you like from the file?"
		name = gets.chomp
		answer = @values[name]
		if @values.has_key?(name)
			puts answer
		else
			puts "That param doesn't exist in the file"
		end
		prompt_user
	end
end

thing = ParseIt.new
thing.intake