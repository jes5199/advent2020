numbers = nil
File.open("input9.txt") do |f|
  numbers = f.each_line.map(&:to_i)
end

window = 25

#numbers = [35, 20, 15, 25, 47, 40, 62, 55, 65, 95, 102, 117, 150, 182, 127, 219, 299, 277, 309, 576]
#window = 5

p numbers

##sums = (1..window).map do |t|
##  p ( numbers[0...-1].zip(numbers[t..-1]).map{|a,b| a && b && [a,b]} )
##  numbers[0...(-t)].zip(numbers[t..-1]).map{|a,b| a && b && a+b}
##end

##sums.each {|sum| p sum}

num = nil
(window...(numbers.length)).each do |pos|
  num = numbers[pos]
  matched = false
  (0...window).each do |y|
    ((pos-window)...(pos-y)).each do |x|
      val = numbers[x] + numbers[x+y+1]
      if val == num
        matched = true
        break
      end
    end
    break if matched
  end
  unless matched
    print "part a: "
    puts num
    break
  end
end

a = 0
b = 0
acc = numbers[0]

loop do
  if acc > num and a < b
    acc -= numbers[a]
    a += 1
  elsif acc < num
    b += 1
    acc += numbers[b]
  else
    p [a,b]
    range = numbers[a..b]
    p range
    p range.sum
    p range.min
    p range.max
    print "part b: "
    p (range.min + range.max)
    break
  end
end

