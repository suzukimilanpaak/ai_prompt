# Can you write me a whole program of the game called snake in ruby, which works in the terminal of linux?
# I want to play it in the terminal of linux.
class Snake
  def initialize
    @snake = [[0, 0]]
    @food = [rand(10), rand(10)]
    @direction = [1, 0]
    @score = 0
  end

  def draw
    puts "Score: #{@score}"
    puts "Food: #{@food}"
    puts "Snake: #{@snake}"
    puts "Direction: #{@direction}"
  end

  def move
    @snake.each_with_index do |snake, index|
      if index == 0
        @snake[index] = [@snake[index][0] + @direction[0], @snake[index][1] + @direction[1]]
      else
        @snake[index] = @snake[index - 1]
      end
    end
  end

  def eat
    if @snake[0] == @food
      @snake << @snake[-1]
      @food = [rand(10), rand(10)]
      @score += 1
    end
  end

  def check
    if @snake[0][0] < 0 || @snake[0][0] > 9 || @snake[0][1] < 0 || @snake[0][1] > 9
      puts "Game Over"
      exit
    end

    @snake.each_with_index do |snake, index|
      if index != 0
        if snake == @snake[0]
          puts "Game Over"
          exit
        end
      end
    end
  end

  def play
    while true
      system "clear"
      draw
      move
      eat
      check
      sleep 0.5
    end
  end
end

snake = Snake.new
snake.play

