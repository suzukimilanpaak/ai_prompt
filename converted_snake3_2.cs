using System;
using System.Collections.Generic;
using System.Linq;

namespace SnakeGame
{
    class Snake
    {
        public List<int[]> Body { get; private set; }
        public string Direction { get; private set; }

        public Snake()
        {
            Body = new List<int[]>
            {
                new[] {10, 10},
                new[] {10, 11},
                new[] {10, 12}
            };
            Direction = "left";
        }

        public void Move()
        {
            Body.RemoveAt(0);
            Body.Add(NextPosition());
        }

        public void Grow()
        {
            Body.Add(NextPosition());
        }

        public int[] NextPosition()
        {
            int[] head = Body.Last();
            switch (Direction)
            {
                case "left":
                    return new[] { head[0], head[1] - 1 };
                case "right":
                    return new[] { head[0], head[1] + 1 };
                case "up":
                    return new[] { head[0] - 1, head[1] };
                case "down":
                    return new[] { head[0] + 1, head[1] };
                default:
                    throw new ArgumentException($"Invalid direction: {Direction}");
            }
        }

        public void Left() => Direction = "left";
        public void Right() => Direction = "right";
        public void Up() => Direction = "up";
        public void Down() => Direction = "down";
    }

    class Food
    {
        public int[] Position { get; private set; }

        public Food()
        {
            Position = new[] { new Random().Next(20), new Random().Next(20) };
        }

        public void Regenerate()
        {
            Position = new[] { new Random().Next(20), new Random().Next(20) };
        }
    }

    class Game
    {
        private Snake _snake;
        private Food _food;
        private int _score;

        public Game()
        {
            _snake = new Snake();
            _food = new Food();
            _score = 0;
        }

        public void Start()
        {
            // TODO: Implement the game loop, input handling, and drawing using a C# console or graphical library.
            // The provided code above is a starting point for the game logic.
            // You will need to handle input (e.g. arrow keys), updating the game state, checking for game over conditions, and drawing the game board.
            // Note that the original Ruby code uses the Curses library for input and drawing, which is not available in C#.
        }

        private bool GameOver()
        {
            // TODO: Implement the game over conditions, such as the snake hitting the wall or itself.
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Game game = new Game();
            game.Start();
        }
    }
}

