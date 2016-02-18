def windowed_max_range(arr,window_size)
  current_max_range = nil
  best = 0
  (0..arr.length-window_size).each do |ind|
    window = arr[ind...ind+window_size]
    current_best = window.max - window.min
    if current_best > best
      current_max_range = window
      best = current_best
    end
  end

  current_max_range
end

if __FILE__ == $0
p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == [4, 8]
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == [0, 2, 5]
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == [2, 5, 4, 8]
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == [3, 2, 5, 4, 8]
end
