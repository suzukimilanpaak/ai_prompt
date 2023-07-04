# Write programming code called Snake in ruby.
# The snake should be able to move left, right, up or down.
# The snake should be able to eat the food.
# The snake should be able to grow in size.
# The game should end when the snake hits the wall or itself.
class Snake
  attr_accessor :x, :y, :direction, :body, :score, :food

  def initialize
    @x = 0
    @y = 0
    @direction = 'right'
    @body = [[0, 0]]
    @score = 0
    @food = [rand(1..9), rand(1..9)]
  end

  def move
    case @direction
    when 'left'
      @x -= 1
    when 'right'
      @x += 1
    when 'up'
      @y -= 1
    when 'down'
      @y += 1
    end
    @body.unshift([@x, @y])
    @body.pop
  end

  def grow
    @body.push([@x, @y])
  end

  def eat
    @score += 1
    @food = [rand(1..9), rand(1..9)]
  end

  def hit_wall?
    @x < 0 || @x > 9 || @y < 0 || @y > 9
  end

  def hit_self?
    @body[1..-1].include?([@x, @y])
  end
end

snake = Snake.new
snake.move
snake.grow
snake.eat
snake.hit_wall?
snake.hit_self?
