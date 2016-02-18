#O(n^2)
def bad_two_sum?(arr, target)
  arr.each_with_index do |el, idx|
    (idx+1...arr.length).each do |idx2|
      return true if el + arr[idx2] == target
    end
  end
  false
end


def okay_two_sum?(arr, target)
  arr.each_with_index do |el,ind|
    new_target = (el < target) ? target - el : el - target
    new_idx = arr.bsearch(new_target)
    if new_idx == ind
      next
    elsif new_idx
      return true
    end

  end
  false
end

class Array
  def bsearch(target)
    return nil if empty?
    mid_index = length / 2
    mid_num = self[mid_index]
    left, right = take(mid_index), drop(mid_index + 1)
    if target == mid_num
      return mid_index
    elsif target < mid_num
      left.bsearch(target)
    elsif target > mid_num
      hold = right.bsearch(target)
      (hold.nil?) ? nil : hold + left.length + 1
    end
  end
end

def bad_ass_sum?(arr, target)
  hash = Hash.new(0)
  # arr.each do |el|
  #   hash[el] = el < target ? target - el : el - target
  # end
  #
  # hash.values.any? do |value|
  #   hash.key?(value)
  # end

  arr.each do |el|
    remainder = target - el
    return true if hash[remainder]
    hash[el] = true
  end
  false

end


if __FILE__ == $0
  p bad_ass_sum?([-7, 0, 2, 5, 8, 7], 10)
end
