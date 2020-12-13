#input = "1789,37,47,1889"

input = "19,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,859,x,x,x,x,x,x,x,23,x,x,x,x,13,x,x,x,17,x,x,x,x,x,x,x,x,x,x,x,29,x,373,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,37"


rules = input.split(",").each_with_index.select{|a,b| a != 'x'}.map{|a,b| [a.to_i, b.to_i]}
p rules

remainder = rules[0][1]
step = rules[0][0]

(1...rules.length).each do |i|
  number, target = rules[i]
  puts "(x*#{step} + #{remainder}) % #{number} == #{target} % #{number}"
  answer = (0..number).find do |x|
    (x * step + remainder) % number == target % number
  end
  puts "x = #{answer}"
  remainder += answer * step
  step *= number
end
puts "remainder = #{remainder}"
puts "step = #{step}"
puts "step - remainder = #{step - remainder}"
