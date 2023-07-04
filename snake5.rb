# Write a ruby program to run a game of snake.
# The snake should be able to move up, down, left, and right.
# The snake should be able to eat food.
# The snake should be able to die if it hits the wall or itself.
# The snake should be able to grow when it eats food.
# The snake should be able to move faster as it grows.
# The snake should be able to move faster as time passes.
# The snake should be able to move faster as the game progresses.
# You can use any external libraries you want.
# You can write as many classes as you want.
# We play the game by running the file with ruby.
class Snake
  attr_accessor :x, :y, :direction, :length, :speed, :dead
  def initialize
    @x = 0
    @y = 0
    @direction = 'right'
    @length = 1
    @speed = 1
    @dead = false
  end

  def move
    case @direction
    when 'right'
      @x += 1
    when 'left'
      @x -= 1
    when 'up'
      @y += 1
    when 'down'
      @y -= 1
    end
  end

  def grow
    @length += 1
  end

  def die
    @dead = true
  end
end

class Game
  attr_accessor :snake, :food, :score, :level
  def initialize
    @snake = Snake.new
    @food = [rand(10), rand(10)]
    @score = 0
    @level = 1
  end

  def play
    while true
      draw
      input = get_input
      update(input)
      sleep(0.5)
    end
  end

  def draw
    puts "Score: #{@score}"
    puts "Level: #{@level}"
    puts "Snake: #{@snake}"
    puts "Food: #{@food}"
  end

  def get_input
    puts "Enter direction:"
    gets.chomp
  end

  def update(input)
    @snake.direction = input
    @snake.move
    if @snake.x == @food[0] && @snake.y == @food[1]
      @snake.grow
      @score += 1
      @food = [rand(10), rand(10)]
    end
    if @snake.x < 0 || @snake.x > 9 || @snake.y < 0 || @snake.y > 9
      @snake.die
    end
  end
end

game = Game.new
game.play

