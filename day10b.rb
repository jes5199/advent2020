numbers = File.open("input10.txt").each_line.map(&:to_i).sort
numbers << numbers.last + 3

# the segments that are still in play can be summarized by:
# key: what is the last number enabled?
# value: how many different choices lead to that number?
valid = {
  0 => 1
}
numbers.each do |n|
  newValid = Hash.new(0) # missing entries default to zero

  valid.each do |endswith, count|
    if endswith < n - 3
      # the list is sorted so if the number is too far back to reach we can just forget about it
      # no later number would be able to reach it either
      next
    end
    # there's always exactly two options
    newValid[n] += count # enable this number
    newValid[endswith] += count # disable this number, keeping the old number visible
  end

  p newValid
  valid = newValid
end

# how many choices lead to the last number being enabled?
p valid[numbers.last]
