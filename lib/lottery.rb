class Lottery
	attr_reader :previous_results, :fixed_dozens,:remainding_dozens,:bets
	def initialize
		@previous_results = []
		@fixed_dozens = []
		@remainding_dozens = []
		@bets = []
	end
	def add_previous_result *previous_result
		@previous_results << previous_result.to_a if previous_result.size == 15
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
end