require "spec_helper"

require "lottery"

describe Lottery do 
	it "is possible add previous lottery result" do 
		lottery = Lottery.new
		result = 1..15
		lottery.add_previous_result(result.to_a)

		expect(lottery.previous_results.last.size).to eq(15)
	end
end