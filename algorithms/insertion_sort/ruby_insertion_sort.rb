=begin
  File: ruby_insertion_sort.rb
  Author: Isaac Hernandez
  Date: October 23, 2017
  Summary: Insertion sort in Ruby
=end

def insertion_sort(arry)
  for i in 0..(arry.length - 1) do
    x = arry[i]
    j = i-1
    while((j>=0) && (arry[j]>x))
      arry[j+1] = arry[j];
      j -= 1
    end
    arry[j+1] = x
  end
end

def measure_sort_algo(arry)
  p "================"
  p "UNSORTED: [" + arry.join(", ") + "]"
  time1 = Time.now
  insertion_sort(arry)
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

