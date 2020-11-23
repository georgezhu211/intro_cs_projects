def merge_sort(arr)
  if arr.length < 2
    return arr
  else
    a = merge_sort(arr.slice!(0, arr.length/2))
    b = merge_sort(arr)
    merge(a, b)
  end
end

def merge(left, right)
  temp = []
  until left.empty? && right.empty?
    if left.empty?
      temp << right.shift 
    elsif right.empty?
      temp << left.shift
    else
      (left.first < right.first) ? temp << left.shift : temp << right.shift
    end
  end
  temp
end

arr = [4,8,6,2,1,7,5,3]

p merge_sort(arr)