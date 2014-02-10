require_relative '../lib/lottery'

loto = Lottery.new
loto.add_previous_result(1,2,3,5,6,7,8,13,15,16,17,18,20,21,23)
loto.add_previous_result(1,2,3,5,6,11,12,14,15,16,19,20,21,23,25)
repeated_dozens= loto.find_repeated_dozens
puts "Repeated dozens #{repeated_dozens.size.to_s}"
loto.generate_fixed_dozens
loto.generate_remainding_dozens
loto.generate_bets
puts "Fixed dozens #{loto.fixed_dozens.to_s}"
puts "Remainding Dozens #{loto.remainding_dozens.to_s}"
loto.bets.map.with_index do |bet,index|
	puts "Bet #{index+1} #{bet.to_s}"
end



