program = File.open("input8.txt").each_line.map{|x| i, v = x.split(" "); [i,v.to_i]}

hits = {}

acc = 0
ip = 0

loop do
  command, param = program[ip]
  puts "#{acc}; #{ip}: #{command} #{param}"
  if hits[ip]
    break
  end
  hits[ip] = true
  jmp = 1
  case command
  when "acc"
    acc += param
  when "jmp"
    jmp = param
  when "nop"
  end
  ip += jmp
end
