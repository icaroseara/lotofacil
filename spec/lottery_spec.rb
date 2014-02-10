require "spec_helper"

require "lottery"

describe Lottery do 
	before do 
		@lottery = Lottery.new
	end
	it "is possible add previous lottery result" do 				
		@lottery.add_previous_result(1..15)
		expect(@lottery.previous_results.last.size).to eq(15)
	end
	it "is possible add two previous lottery's results" do 
		@lottery.add_previous_result(1..15)
		@lottery.add_previous_result(1..15)
		expect(@lottery.previous_results.size).to eq(2)
	end
end