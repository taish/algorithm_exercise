require 'pry'

@R, @C = STDIN.gets.split(' ').map(&:to_i)
@start_y, @start_x = STDIN.gets.split(' ').map(&:to_i)
@goal_y, @goal_x = STDIN.gets.split(' ').map(&:to_i)
@h_w_map = []
@reach_map = []
@R.times do |gyo|
  w_array = STDIN.gets.chomp.split('').map(&:to_s)
  @reach_map.push w_array.map{|_| nil }
  @h_w_map.push w_array
end

class Masu
  attr_accessor :x, :y, :count
  def initialize(x, y, count)
    @x = x
    @y = y
    @count = count
  end
end

def bfs_search(x, y)
  queue = []
  queue << Masu.new(x, y, 0)

  while(!queue.empty?) do
    current = queue.shift
    if current.y == @goal_y && current.x == @goal_x
      STDOUT.puts current.count
      exit
    end

    [[0, 1], [1, 0], [0, -1], [-1, 0]].each do |dxdy|
      dx = dxdy[0]
      dy = dxdy[1]
      unless (current.x + dx < 0 || current.x + dx > @C - 1 || current.y + dy < 0 || current.y + dy > @R - 1 || @h_w_map[current.y + dy - 1][current.x + dx - 1] == '#' || !@reach_map[current.y + dy - 1][current.x + dx - 1].nil?
        )
        puts "current is x: #{current.x}, y: #{current.y}, count: #{current.count}"
        puts "next is x: #{current.x + dx}, y: #{current.y + dy}, count: #{current.count + 1}"
        @reach_map[current.y + dy - 1][current.x + dx - 1] = current.count + 1
        queue.push(Masu.new(current.x + dx, current.y + dy, current.count + 1))
      end
    end
  end
end

bfs_search(@start_x, @start_y)
STDOUT.puts 'No'
