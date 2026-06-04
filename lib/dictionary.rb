class Dictionary
  MIN_LENGTH = 5
  MAX_LENGTH = 12

  def initialize(file_path)
    @file_path = file_path
  end

  def choose_random_word
    File.readlines(@file_path).map do |word|
      word.chomp
    end.select { |word| word.length >= MIN_LENGTH && word.length <= MAX_LENGTH }.sample
  end
end
