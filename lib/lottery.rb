class Lottery
	attr_reader :previous_results,:most_frequent_numbers,:fixed_dozens,:remainding_dozens,:bets, :result
	def initialize
		@previous_results = []
		@most_frequent_numbers = Hash.new
		@fixed_dozens = []
		@remainding_dozens = []
		@bets = []
		@result = []
	end
	def add_result *result
		@result << result if result.size != 0
	end
	def add_previous_result previous_result
		previous_result = previous_result.scan(/\d+/)
		if previous_result.size == 15 
			generate_numbers_frequency previous_result
			@previous_results << previous_result
		else 
			puts "previous result: #{previous_result.to_s} haven't 15 numbers"
		end
	end
	def generate_numbers_frequency previous_result
		previous_result.each do |n|
			if @most_frequent_numbers.has_key?(n.to_i)
				@most_frequent_numbers[n.to_i] += 1
			else
				@most_frequent_numbers[n.to_i] = 1
			end
		end
	end
	def generate_fixed_dozens
		@fixed_dozens = @most_frequent_numbers.select {|k,v| v == @previous_results.size} 		
		return generate_possibilities(@previous_results.size-1)
	end
	def generate_possibilities(frequency)
		possibilities = @most_frequent_numbers.select {|k,v| v == frequency}
		@fixed_dozens = @fixed_dozens.merge(Hash[possibilities.to_a.sample((14 - @fixed_dozens.size))])
		if @fixed_dozens.size == 14
			@fixed_dozens = @fixed_dozens.keys.to_a.sort!			
		else
			return generate_possibilities(frequency-1)
		end
	end	
	def generate_remainding_dozens		
		@remainding_dozens = (1..25).to_a.select{|item| !fixed_dozens.include?(item)}
	end
	def generate_bets		
		@remainding_dozens.each do |r|
			bet = []	 
			bet << r 
			bet = @fixed_dozens | bet
			bets << bet.sort!
		end
	end
	def show_bets
		puts "Bets:"
		@bets.map.with_index do |bet,index|
			puts "Bet #{index+1} #{bet.to_s}"
		end
	end
	def bets_result
		puts "Bets results:"
		@bets.map.with_index do |bet,index|
			points = @result.first & bet 
			puts "Bet #{index+1} #{bet.to_s} Qtd points: #{points.size}"
		end
	end
end