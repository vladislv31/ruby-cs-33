def average(array)
  sum = array.inject(0) { |result, element| result + element }
  sum.to_f / array.length
end

array = [1, 2, 3, 4, 5]
puts average(array)
