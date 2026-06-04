class Game
  MAX_LIVES = 6

  def initialize(secret_word)
    @secret_word = secret_word.upcase.chars
    @display_word = Array.new(secret_word.length, '_')
    @remaining_lives = MAX_LIVES
    @incorrect_guesses = []
    @correct_guesses = []
  end

  def play
    puts 'Guess the secret word!\n'

    until game_over?
      puts "Word: #{@display_word.join(' ')}"
      puts "Lives left: #{@remaining_lives}"
      puts "Misses: #{@incorrect_guesses.join(', ')}"
      prompt_and_evaluate_guess
    end

    if won?
      puts "You won! The secret word was #{@secret_word.join}"
    else
      puts "You ran out of lives! The secret word was #{@secret_word.join}"
    end
  end

  def game_over?
    won? || ran_out_of_lives?
  end

  def won?
    @display_word == @secret_word
  end

  def ran_out_of_lives?
    @remaining_lives <= 0
  end

  private

  def prompt_and_evaluate_guess
    guess = prompt_guess
    evaluate_guess(guess)
  end

  def evaluate_guess(letter)
    if @secret_word.include?(letter)
      @correct_guesses.push(letter)
      @secret_word.each_with_index do |secret_char, i|
        @display_word[i] = secret_char if secret_char == letter
      end
      puts 'Hit!'
    else
      @incorrect_guesses.push(letter)
      @remaining_lives -= 1
      puts 'Miss!'
    end
  end

  def prompt_guess
    print 'Input a letter: '
    guess = gets.chomp.upcase
    until guess.length == 1 && guess.match?(/[A-Z]/) && !already_guessed?(guess)
      if already_guessed?(guess)
        print 'Letter has already been used. Try again: '
      else
        print 'Invalid input. Try again: '
      end
      guess = gets.chomp.upcase
    end
    guess
  end

  def already_guessed?(letter)
    @incorrect_guesses.include?(letter) || @correct_guesses.include?(letter)
  end
end
