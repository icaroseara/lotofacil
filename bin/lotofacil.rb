require_relative '../lib/lottery'

loto = Lottery.new
# change the next lines with the last previous results
# 1020 - 02 03 05 07 09 11 12 13 15 16 18 19 20 21 24
loto.add_previous_result("02 03 05 07 09 11 12 13 15 16 18 19 20 21 24")
# 1019 - 01	02 03 04 05 07 08 10 12	17 18 20 21	22 23
loto.add_previous_result("01 02 03 04 05 07 08 10 12 17 18 20 21 22 23")
# 1018 - 02 04 05 07 08 10 11 12 14 16 17 18 19 22 24
loto.add_previous_result("02 04 05 07 08 10 11 12 14 16 17 18 19 22 24")
# 1017 - 01 02 03 04 08 09 10 11 12 15 16 17 19 21 23
loto.add_previous_result("01 02 03 04 08 09 10 11 12 15 16 17 19 21 23")
# 1016 - 01	02 03 05 06	11 12 14 15 16 19 20 21	23 25
loto.add_previous_result("01 02 03 05 06 11 12 14 15 16 19 20 21 23 25")
# 1015 - 01 02 03 05 06 07 08 13 15 16 17 18 20 21 23
loto.add_previous_result("01 02 03 05 06 07 08 13 15 16 17 18 20 21 23")
# 1014 - 01	02 08 09 10 12 13 14 17 18 20 22 23 24 25
# loto.add_previous_result("01 02 08 09 10 12 13 14 17 18 20 22 23 24 25")

loto.generate_fixed_dozens
puts "Fixed dozens #{loto.fixed_dozens.to_s}"
loto.generate_remainding_dozens
puts "Remainding Dozens #{loto.remainding_dozens.to_s}"
loto.generate_bets
loto.show_bets
# uncomment the next line with the lotofacil's result if the result was announced already
# loto.add_result(2,4,5,7,8,10,11,12,14,16,17,18,19,22,24)
loto.add_result # and comment this line if the lotofacil's resuls was announced already
loto.bets_result if loto.result.size != 0


