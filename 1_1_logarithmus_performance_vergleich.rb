# Performance Vergleich der verschiedenen Implementationen
# Author:: Uwe Krause

require '1_1_logarithmus_naturalis'

range = [
  0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0,
  1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9]
times = 100

start_for = Time.new
times.times do
  range.each { |x|
    my_ln = ln(x, 1)
    #log = Math::log(x)
    #puts "#{x} INFINITY! *** *** *** " * 5 if my_ln.infinite? == -1
    #puts ""
  }
end
ende_for = Time.new

start_reduce = Time.new
times.times do
  range.each { |x|
    my_ln = ln(x, 2) # 2 !
  }
end
ende_reduce = Time.new

start_rekursiv = Time.new
times.times do
  range.each { |x|
    my_ln = ln(x, 3)
  }
end
ende_rekursiv = Time.new

puts dauer_for = "#{ende_for - start_for} for"
puts dauer_reduce = "#{ende_reduce - start_reduce} reduce"
puts dauer_rekursiv = "#{ende_rekursiv - start_rekursiv} rekursiv"