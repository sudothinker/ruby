def merge_sort(arr)
  return arr if arr.size == 1
  
  middle = arr.size % 2 == 0 ? arr.size / 2 - 1 : (arr.size - 1) / 2
  merge(merge_sort(arr[0..middle]), merge_sort(arr[middle+1..arr.size-1]))
end

# Time -> order(n) on total elements
# Linear
def merge(arr1, arr2)
  output = []
  
  total_size = arr1.size + arr2.size
  (0..total_size-1).each do |n|
    if arr2.size == 0
      output << arr1.delete_at(0)
      next
    end
    if arr1.size == 0
      output << arr2.delete_at(0)
      next
    end
    
    if arr1[0] <= arr2[0]
      output << arr1.delete_at(0)
    else
      output << arr2.delete_at(0)
    end
  end
  output
end

puts merge_sort([2, 3, 10, 4, 1, 5, 2, 9, 6]).inspect