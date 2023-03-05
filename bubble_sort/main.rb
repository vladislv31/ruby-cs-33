def bubble_sort(arr)
  n = arr.length

  (n-1).times do |i|
    (n-i-1).times do |j|
      if arr[j] > arr[j+1]
        arr[j], arr[j+1] = arr[j+1], arr[j]
      end
    end
  end

  arr
end

arr = [99, -1, 20, 25, -98, 100, -67, 1, 6]
sorted_arr = bubble_sort(arr)
puts sorted_arr
