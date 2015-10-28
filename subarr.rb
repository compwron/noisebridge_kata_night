# Given is an array containing N numbers, which are either 1, 0 or -1.
# Find out the length of the longest contiguous subsequence going from index i to j, such that A[i]+A[i+1]..+A[j-1]+A[j] == 0.



def substr0(arr)
  if arr.inject(&:+) == 0
    return [0, arr.length - 1]
  end

  front = 0
  back = arr.length - 1

  while front < back
    front += 1
    back.downto(front) do |i|
      if arr[front..i].inject(&:+) == 0
        p arr[front..i]
        return [front, i]
      end
    end
  end
  [arr.index(0), arr.index(0)]
end

a = [0, -1, 1, 0, 0, 0, 0, 1]
p a
p substr0(a)

def substr0_1(arr)
  biggest_gap = 0
  win_pair = [0, 0]
  0.upto(arr.length - 1) do |i|
    0.upto(arr.length - 1) do |j|
      if i.upto(j).map {|k| arr[k]}.inject(&:+) == 0
        new_abs = (i - j).abs
        if new_abs > biggest_gap
          win_pair = [i, j]
          biggest_gap = new_abs
        end
      end
    end
  end
  win_pair
end
