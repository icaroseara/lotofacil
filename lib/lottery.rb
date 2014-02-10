class Lottery
	attr_reader :previous_results
	def initialize
		@previous_results = []
	end
	def add_previous_result previous_result
		@previous_results << previous_result.to_a
	end
end