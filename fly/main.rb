string = ARGV[0]

count = Hash.new(0)

string.each_char do |char|
  count[char] += 1
end

count.each do |char, count|
  puts "#{char} - #{count}"
end
