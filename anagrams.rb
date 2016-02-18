
def first_anagram(str,find)
  perms = str.chars.permutation(str.size).map do |s|
    s.join
  end

  perms.include?(find)
end

def second_anagram(str1, str2)
  str1, str2 = str1.chars, str2.chars
  str1.each_with_index do |x, dx|
    str2.each_with_index do |y, dy|
      if x == y
        str1[dx], str2[dy] = nil, nil
        break
      end
    end
  end
  str1, str2 = str1.compact, str2.compact

  str1.empty? && str2.empty?
end

# O(n logn)
def third_anagram(str1, str2)
  str1.chars.sort == str2.chars.sort
end

# O(n)
def fourth_anagram(str1, str2)
  hash = Hash.new(0)

  str1.chars.each { |el| hash[el] += 1 }
  str2.chars.each { |el| hash[el] -= 1 }
  hash.values.all? { |val| val.zero? }

end
