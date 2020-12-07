counts = {}

while counts["shiny gold"].nil?
  File.open("input7.txt") do |file|
    file.each_line do |line|
      m = line.match(/(.*) bags contain (.*)\./)
      _entire, bag, contents = m.to_a
      if contents =~ /no other bags/
        counts[bag] = 0
      else
        inner_counts = contents.split(/, /).map do |contained|
          cm = contained.match(/(\d*) ?(.*) bags?/)
          _entire, count, inner_bag = cm.to_a
          counts[inner_bag].nil? ? nil : (count.to_i * (1 + counts[inner_bag]))
        end
        unless inner_counts.any?(&:nil?)
          counts[bag] = inner_counts.inject(&:+)
        else
        end
      end
    end
  end
end

require 'pp'
pp counts
puts counts["shiny gold"]
