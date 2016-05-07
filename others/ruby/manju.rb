
while str = STDIN.gets
  break if str.chomp == "exit"
  inputs = str.chomp.split(' ').map{|x| x.to_i}
end

puts inputs[2] / inputs[0..1].min
