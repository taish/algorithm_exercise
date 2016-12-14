@H, @W = STDIN.gets.split(' ').map(&:to_i)
@h_w_map = []
@reach_map = []
@H.times do |gyo|
  w_array = STDIN.gets.chomp.split('').map(&:to_s)
  @reach_map.push w_array.map{|_| false }
  @h_w_map.push w_array
end

def search(x, y)
  return if (x < 0 || x > @W - 1 || y < 0 || y > @H - 1 || @h_w_map[y][x] == '#')
  return if @reach_map[y][x]
  @reach_map[y][x] = true
  if @h_w_map[y][x] == 'g'
    STDOUT.puts 'Yes'
    exit
  end

  search(x + 1, y)
  search(x, y + 1)
  search(x - 1, y)
  search(x, y - 1)
end

for y in 0..@H-1 do
  for x in 0..@W-1 do
    if @h_w_map[y][x] == 's'
      search(x, y)
      break
    end
  end
end
STDOUT.puts 'No'
