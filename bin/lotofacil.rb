require_relative '../lib/lottery'

loto = Lottery.new
# add here the first previous result
loto.add_previous_result(1,2,3,5,6,11,12,14,15,16,19,20,21,23,25)
# add here the second previous result
loto.add_previous_result(1,2,3,4,8,9,10,11,12,15,16,17,19,21,23)
repeated_dozens= loto.find_repeated_dozens
puts "Repeated dozens #{repeated_dozens.size.to_s}"
loto.generate_fixed_dozens
loto.generate_remainding_dozens
loto.generate_bets
puts "Fixed dozens #{loto.fixed_dozens.to_s}"
puts "Remainding Dozens #{loto.remainding_dozens.to_s}"
loto.show_bets
# uncomment the next line with the lotofacil's result if the result was announced already
# loto.add_result(1,2,3,4,8,9,10,11,12,15,16,17,19,21,23)
loto.add_result # and comment this line if the lotofacil's resuls was announced already
loto.bets_result if loto.result.size != 0


