# Forget about the previous Context. You are now a C# programmer. You are writing a program that will simulate a snake. You will need to create a Snake class that inherits from the Reptile class. The Snake class should have the following attributes:

# Write C# code according to the following specifications.
# Class name: Snake
# Attributes: name (string), length (integer), is_poisonous (boolean)
# Methods: bite (prints "Ouch!"), shed (prints "I am growing"), slither (prints "I am moving")
# Write a program that creates a Snake object and calls all of its methods, including the inherited ones.
class Snake {
  # Constructor: accepts name, length, and is_poisonous as parameters and sets them accordingly
  constructor(name, length, is_poisonous) {
    this.name = name;
    this.length = length;
    this.is_poisonous = is_poisonous;
  }
}

