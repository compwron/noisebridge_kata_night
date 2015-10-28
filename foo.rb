def foo(arr)
  0.upto(arr.length - 1) do |i|
    j = i
    while j > 0 && arr[j - 1] < arr[j]
      temp_j = arr[j]
      arr[j] = arr[j - 1]
      arr[j - 1] = temp_j
      j = j - 1
    end
  end
  arr
end
unsorted = [1, 5, 2, 6, 4]
p unsorted
p foo(unsorted)
