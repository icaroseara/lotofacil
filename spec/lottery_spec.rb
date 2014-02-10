require "spec_helper"

require "lottery"

describe Lottery do 
	context "when the lottery adds the previous result" do
		before do 
			@lottery = Lottery.new
			@lottery.add_previous_result(1..15)
		end
		it "is possible add previous lottery result" do 				
			expect(@lottery.previous_results.last.size).to eq(15)
		end
		context "when the lottery adds the two previous result" do
			before do
				@lottery.add_previous_result(11..25)
			end			
			it "is possible add two previous lottery's results" do 				
				expect(@lottery.previous_results.size).to eq(2)
			end
			it "is possible find dozens repeated in two previous results" do
				expect(@lottery.find_repeated_dozens.size).to eq(5)
			end
		end
	end
end