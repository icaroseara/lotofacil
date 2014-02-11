class Lottery
	attr_reader :previous_results, :fixed_dozens,:remainding_dozens,:bets, :result
	def initialize
		@previous_results = []
		@fixed_dozens = []
		@remainding_dozens = []
		@bets = []
		@result = []
	end
	def add_previous_result *previous_result
		@previous_results << previous_result.to_a if previous_result.size == 15
	end
	def add_result *result
		@result << result if result.size != 0
	end
	def find_repeated_dozens
		@previous_results.first & @previous_results.last if @previous_results.size == 2
	end
	def generate_fixed_dozens		
		@fixed_dozens = find_repeated_dozens.sort 
		while @fixed_dozens.size != 14			
			item = @previous_results.last.sample
			@fixed_dozens.push(item) unless fixed_dozens.include?(item)			
		end	
		@fixed_dozens.sort!
	end	
	def generate_remainding_dozens
		all = 1..25
		@remainding_dozens = all.to_a.select{|item| !fixed_dozens.include?(item)}
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