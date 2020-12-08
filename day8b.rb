program = File.open("input8b.txt").each_line.map{|x| i, v = x.split(" "); [i,v.to_i]}

hits = {}

acc = 0
ip = 0
flip = -1

loop do
  command, param = program[ip]
  if command.nil?
    puts "#{ip+1}: done ; acc:#{acc}; flip:#{flip}"
    break
  end
  if ip == flip
    if command == "jmp"
      command = "nop"
    elsif command = "nop"
      command = "jmp"
    end
  end
  puts "#{ip+1}: #{command} #{param} ; acc:#{acc}"
  if hits[ip]
    hits = {}
    ip = 0
    flip += 1
    acc = 0
    puts "restarting with flip@#{flip}"
    next
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
