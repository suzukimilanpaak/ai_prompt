using System;
using System.Collections.Generic;
using System.Linq;

namespace SnakeGame
{
    public class Snake
    {
        public List<int[]> Body { get; private set; }
        public string Direction { get; private set; }

        public Snake()
        {
            Body = new List<int[]> { new[] { 10, 10 }, new[] { 10, 11 }, new[] { 10, 12 } };
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
            return Direction switch
            {
                "left" => new[] { head[0], head[1] - 1 },
                "right" => new[] { head[0], head[1] + 1 },
                "up" => new[] { head[0] - 1, head[1] },
                "down" => new[] { head[0] + 1, head[1] },
                _ => throw new InvalidOperationException("Invalid direction")
            };
        }

        public void Left() => Direction = "left";
        public void Right() => Direction = "right";
        public void Up() => Direction = "up";
        public void Down() => Direction = "down";
    }

    public class Food
    {
        public int[] Position { get; private set; }
        private readonly Snake _snake;
        private readonly Food _food;
        private int _score;

        public Game()
        {
            _snake = new Snake();
            _food = new Food();
            _score = 0;
        }

        public void Start()
        {
            throw new NotImplementedException("Curses library is not available in C#. You can use a different library to implement the game loop and handle user input.");
        }

        public bool GameOver()
        {
            throw new NotImplementedException("Implement the game over condition, e.g., when the snake hits the wall or itself.");
        }

        public void Draw()
        {
            throw new NotImplementedException("Implement the draw method to display the game board, snake, and food.");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            var game = new Game();
            game.Start();
        }
    }
}
