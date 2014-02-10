class Lottery
	attr_reader :previous_results
	def initialize
		@previous_results = []
	end
	def add_previous_result previous_result
		@previous_results << previous_result.to_a if previous_result.size == 15
	end
	def find_repeated_dozens
		@previous_results.first & @previous_results.last if @previous_results.size == 2
	end
end