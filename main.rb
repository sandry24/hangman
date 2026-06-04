require 'yaml'
require_relative 'lib/dictionary'
require_relative 'lib/game'

puts '1) Start New Game'
puts '2) Load Saved Game'
print 'Choose an option: '
choice = gets.chomp

if choice == '2' && File.exist?('saves/savegame.yaml')
  yaml_data = File.read('saves/savegame.yaml')
  game = YAML.safe_load(yaml_data, permitted_classes: [Game])
  puts 'Resuming...'
else
  dict_path = File.expand_path('data/google-10000-english-no-swears.txt', __dir__)
  dictionary = Dictionary.new(dict_path)
  game = Game.new(dictionary.choose_random_word)
end

game.play
