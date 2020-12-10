numbers = File.open("input10.txt").each_line.map(&:to_i).sort
numbers << numbers.last + 3

valid = {
  0 => 1
}
numbers.length.times do |i|
  n = numbers[i]
  newValid = Hash.new(0)
  valid.each do |endswith, count|
    if endswith < n - 3
      next
    end
    newValid[n] += count
    newValid[endswith] += count
  end
  valid = newValid
  p newValid
end

p valid[numbers.last]
