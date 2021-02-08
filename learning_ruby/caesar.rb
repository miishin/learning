def caesar_shift(input_str, shift_val)
  input_as_numbers = input_str.chars.map(&:ord)
  shifted = []
  shift = shift_val % 26
  input_as_numbers.each do |n|
    if n.between?(65, 90)
      shifted.append(caesar_helper(n, shift, 65, 90).chr)
    elsif n.between?(97, 122)
      shifted.append(caesar_helper(n, shift, 97, 122).chr)
    end
  end
  return shifted.join("")
end

def caesar_helper(ascii_val, shift_val, lower_bound, upper_bound)
  if ascii_val + shift_val < lower_bound
    return ascii_val + shift_val + 26
  elsif ascii_val + shift_val > upper_bound
    return ascii_val + shift_val - 26
  else
    return ascii_val + shift_val
  end
end

puts caesar_shift(ARGV[0], ARGV[1].to_i)