=begin
  File: ruby_bubble_sort.rb
  Author: Isaac Hernandez
  Date: November 30, 2017
  Summary: Bubble sort in Ruby
=end

def bubble_sort(arry)
  for i in 0..(arry.length-1) do
    swapped = false
    for j in 1..((arry.length-1)-i) do
      if (arry[j-1] > arry[j])
        arry.swap!(j-1,j)
        swapped = true
      end
    end
    unless swapped
      break      
    end
  end
end

class Array
  def swap!(i,j)
    self[i], self[j] = self[j], self[i]
    self
  end
end

def measure_sort_algo(arry)
  p "================"
  p "UNSORTED: [" + arry.join(", ") + "]"
  time1 = Time.now
  bubble_sort(arry)
  time2 = Time.now
  p "SORTED  : [" + arry.join(", ") + "]"
  p "TIME    : " + (time2 - time1).to_s + " ms"
  p "==============="
end

if __FILE__ == $0
  n = gets.strip.to_i
  for i in 0 .. (n-1) do
    input2 = gets.strip.split(' ')
    inp_type = input2[0]
    inp_n = input2[1].to_i
    arry = []
    if inp_n > 0
      input3 = gets.strip.split(' ')
      arry = (inp_type == "int") ? input3.map{ |i| i.to_i } : input3
    end
    measure_sort_algo(arry)
  end
end

