require_relative 'lib/dictionary'
require_relative 'lib/game'

dict_path = File.expand_path('data/google-10000-english-no-swears.txt', __dir__)
dictionary = Dictionary.new(dict_path)
game = Game.new(dictionary.choose_random_word)
game.play
