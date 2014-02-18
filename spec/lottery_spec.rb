require "spec_helper"

require "lottery"

describe Lottery do 
	context "when the lottery adds the previous result" do
		before do 
			@loto = Lottery.new
			@loto.add_previous_result("02 04 05 07 08 10 11 12 14 16 17 18 19 22 24")
		end
		it "is possible add previous lottery result" do 				
			expect(@loto.previous_results.last.size).to eq(15)
		end

		context "when the lottery adds the five previous result" do
			before do
				@loto.add_previous_result("01 02 03 04 08 09 10 11 12 15 16 17 19 21 23")				
				@loto.add_previous_result("01 02 03 05 06 07 08 13 15 16 17 18 20 21 23")				
				@loto.add_previous_result("01 02 08 09 10 12 13 14 17 18 20 22 23 24 25")				
				@loto.add_previous_result("01 02 03 04 05 07 10 11 13 17 18 19 20 21 23")
			end			
			it "is possible add five previous lottery's results" do 				
				expect(@loto.previous_results.size).to eq(5)
			end
			context "when generate fixed dozens" do
				before do
					@loto.generate_fixed_dozens	
				end
				it "is possible generate fixed dozens" do
					expect(@loto.fixed_dozens.size).to eq(14)
				end				
				context "when generate remaining dozens" do
					before do
						@loto.generate_remainding_dozens
					end
					it "is possible generate remaining dozens" do 					
						expect(@loto.remainding_dozens.size).to eq(11)
					end					
					context "when the bets were generated" do
						before do
							@loto.generate_bets
						end
						it "is possible generate bets" do						
							expect(@loto.bets.size).to eq(11)
						end
						it "is possible verify if any bets win the prize" do							
							@loto.add_result(1,2,3,4,8,9,10,11,12,15,16,17,19,21,23)							
							expect(@loto.result.size).to eq(1)
						end
					end
				end
			end
		end
	end
end