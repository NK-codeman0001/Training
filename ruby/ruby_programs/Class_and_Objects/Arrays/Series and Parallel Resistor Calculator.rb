=begin 
Series and Parallel Resistor Calculator

Create a function that takes an array of resistors and calculates the output of total resistance if the circuit is connected in parallel or in series.
Examples

resistance_calculator([10, 20, 30, 40, 50]) ➞ [4.38, 150]

resistance_calculator([25, 14, 65, 18]) ➞ [5.48, 122]

resistance_calculator([10, 10]) ➞ [5, 20]

resistance_calculator([0, 0, 0, 0]) ➞ [0, 0]

resistance_calculator([1.1, 2.1, 3.2, 4.3, 5.4, 6.5]) ➞ [0.44, 22.6]

Notes

    Return parallel resistance as the first element and series resistance as second element of the array.
    Round up the total resistance to two decimal places.
=end

def resistance_calculator(resistors)
  ser = 0.00
  par = 0.00
  ser=resistors.reduce(:+)
  if resistors.include?(0)
    return [0,ser.round(2)]
  end
  for i in 0...resistors.length
    par += 1.0/resistors[i]
  end
  par= 1/par
  return [par.round(2),ser.round(2)]
end


p resistance_calculator([10, 20, 30, 40, 50]) # [4.38, 150]
p resistance_calculator([25, 14, 65, 18]) # [5.48, 122]
p resistance_calculator([10, 10]) # [5, 20]
p resistance_calculator([0, 0, 0, 0]) # [0, 0]
p resistance_calculator([1.1, 2.1, 3.2, 4.3, 5.4, 6.5]) # [0.44, 22.6]
p resistance_calculator([12345, 0]) #  [0, 12345]