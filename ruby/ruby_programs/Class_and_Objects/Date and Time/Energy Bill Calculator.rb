=begin
 Energy Bill Calculator

Create a function that calculates an energy bill.

Given a billing start date and end date, start and end meter reading, a unit price in pence, and a standing charge (a daily rental fee for your meter) as arguments, calculate your bill.

An energy bill is calculated by multiplying the difference between meter readings with the unit price and adding the number of days multiplied by the standing charge. You then have to add 5% tax.

(days between dates x standing charge) + (diference bewteen meter readings x unit price) + 5% tax
Examples

energy_bill("2020,01,01", "2020,04,01", 1000, 2000, 0.188, 0.243),  = "$220.62"
"2020,04,01" (end date) - "2020,01,01" ( start date ),  = 91 days
2000 ( end meter read )- 1000 ( start meter read ) = 1000 units used
1000 (units) * 0.188p (each unit cost) = $188
91 (days) * 0.243p (standing charge) == $22.113
22.113 (Total standing charge cost) + $188 (total unit cost) = $210.113
210.113 (cost) * 0.05 (uk tax on energy) = 10.50565
210.113 (cost) + 10.50565 (tax) = 220.61865
answer = "$220.62"

Notes

    If the end date is an earlier date from the start date return "Invalid date".
    If the end meter reading is less then the start meter reading return "Invalid meter readings".
    Please bring to my attention any clarity issues. 
=end
require 'time'

def energy_bill(start_date, end_date, start_read, end_read, tariff, stand)
  sd= Time.parse(start_date.gsub(',','-'))
  ed= Time.parse(end_date.gsub(',','-'))
  if ed < sd
    return "Invalid date"
  elsif end_read < start_read
    return "Invalid meter readings"
  end
  day_diff = (ed - sd)/ (60*60*24)
  meter_diff = end_read - start_read

#(days between dates x standing charge) + (diference bewteen meter readings x unit price) + 5% tax
  bill_amount = ((day_diff * stand) + (meter_diff * tariff)) * 1.05
  return "$#{bill_amount.round(2)}"
end

p energy_bill("2020,01,01", "2020,04,01", 1000, 2000, 0.188, 0.243)  # "$220.62"
p energy_bill("1984,04,19", "1991,04,10", 2000, 1000, 0.61, 0.074)  # "Invalid meter readings"
p energy_bill("2020,01,01", "2019,01,01", 1000, 2000, 0.171, 0.243)  # "Invalid date"
