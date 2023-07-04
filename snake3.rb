# Could you make a snake game?
# Please write the code in ruby.
# Use standard libraries only.
# Snake game is a game where the snake eats the food and grows.
# The snake is represented by a series of Xs.
# The food is represented by a O.
# The snake moves in the direction of the arrow keys.
# The snake grows when it eats the food.
# The game ends when the snake hits the wall or itself.
# The game starts with a snake of length 3.
# The food is randomly placed on the board.
# The board is 20x20.
# The snake is initially placed at the center of the board.
# The food is initially placed at a random location on the board.
# The snake moves one cell at a time.
# The snake grows by one cell when it eats the food.
# The snake moves faster as it grows longer.
# You can use any external ruby library if you want.

require 'curses'

class Snake
  attr_reader :body, :direction

  def initialize
    @body = [[10, 10], [10, 11], [10, 12]]
    @direction = :left
  end

  def move
    @body.shift
    @body.push(next_position)
  end

  def grow
    @body.push(next_position)
  end

  def next_position
    head = @body.last
    case @direction
    when :left
      [head[0], head[1] - 1]
    when :right
      [head[0], head[1] + 1]
    when :up
      [head[0] - 1, head[1]]
    when :down
      [head[0] + 1, head[1]]
    end
  end

  def left
    @direction = :left
  end

  def right
    @direction = :right
  end

  def up
    @direction = :up
  end

  def down
    @direction = :down
  end
end

class Food
  attr_reader :position

  def initialize
    @position = [rand(20), rand(20)]
  end

  def regenerate
    @position = [rand(20), rand(20)]
  end
end

class Game
  def initialize
    @snake = Snake.new
    @food = Food.new
    @score = 0
  end

  def start
    Curses.init_screen
    Curses.noecho
    Curses.curs_set(0)
    Curses.timeout = 100

    loop do
      draw
      input = Curses.getch
      case input
      when Curses::Key::LEFT
        @snake.left
      when Curses::Key::RIGHT
        @snake.right
      when Curses::Key::UP
        @snake.up
      when Curses::Key::DOWN
        @snake.down
      end

      @snake.move
      if @snake.body.include?(@food.position)
        @score += 1
        @snake.grow
        @food.regenerate
      end

      break if game_over?
    end

    Curses.close_screen
    puts "Game over! Your score is #{@score}."
  end
# continue here
  def draw

