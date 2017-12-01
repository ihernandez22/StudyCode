=begin
  File: ruby_quick_sort.rb
  Author: Isaac Hernandez
  Date: October 23, 2017
  Summary: Quicksort in Ruby. Simple implementation with Hoares or Lomutos partition.
=end

def quicksort(arry)
  quicksort_helper(arry, 0, arry.length-1)
end

def quicksort_helper(arry, low, high)
  if (low < high)
    index = hoares_partition(arry, low, high)
    quicksort_helper(arry, low, index-1)
    quicksort_helper(arry, index, high)
  end
end

class Array
  def swap!(i,j)
    self[i], self[j] = self[j], self[i]
    self
  end
end

def hoares_partition(arry, low, high)
  pivot = arry[(low+high)/2]
  while low <= high
    low += 1 while arry[low] < pivot
    high -= 1 while arry[high] > pivot

    if low <= high
      arry.swap! low, high
      low += 1
      high -= 1
    end
  end
  return low
end

def lomutos_partition(arry, low, high)
  pivot = arry[high]
  i = low
  for j in low..(high-1) do
    if arry[j] < pivot
      arry.swap! i, j
      i += 1
    end
  end
  arry.swap! i, high if arry[high] < arry[i]
  return i-1
end

def measure_sort_algo(arry)
  p "================"
  p "UNSORTED: [" + arry.join(", ") + "]"
  time1 = Time.now
  quicksort(arry)
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

