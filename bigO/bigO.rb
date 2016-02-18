# O(n^2)
def my_min
  list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

  list.each_with_index do |el,ind|
    return el if (ind+1...list.length).all? do |x|
      el < list[x]
    end
  end
end

#O(n)
def my_min2
  list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
  min = list.first

  list.each do |el|
    min = el if el < min
  end

  min
end

# O(n^2)
def largest_contiguous_subsum
  list = [5, 3, -7]
  sub_sets = []

  list.each_index do |ind|
    (ind...list.length).each do |x|
      sub_sets << list[ind..x]
    end
  end

  sub_sets.map do |el|
    sum(el)
  end.max
end

def sum(arr)
  sum = 0
  arr.each do |el|
    sum += el
  end

  sum
end

def largest_contiguous_subsum_2(arr)
  max = 0
  running_total = 0
    arr.each do |el|
      running_total += el
      running_total = 0 if running_total < 0
      max = running_total if running_total > max
    end

  max 
end
