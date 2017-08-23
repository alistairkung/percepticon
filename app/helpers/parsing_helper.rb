module ParsingHelper
  MULTIPLIER = 1
  STARTING_PRONOUNS = [
    "he", "she", "i", "it", "you", "my", "it's", "they",
    "they'll", "he'll", "she'll", "you'll", "here's", "this", "people",
    "how", "why", "memes"
  ].freeze

  KEY_WORDS = [
    "sex", "things", "number", "these", "believe", "tips", "tweets",
    "never", "photos", "photo", "best", "make", "just", "kardashian",
    "jenner", "memes", "people", "times", "worst", "questions", "never",
    "know", "this", "what", "ways"
  ].freeze

  KEY_PHRASES = [
    "here's why", "here's what", "you'll never", "that will", "this is", "how to",
    "the most", "what this", "when you", "and it's", "and we'll", "wait till",
    "this guy", "blow your", "the reason", "make you", "looks like", "pictures of",
    "the internet", "can you", "you didn't", "you need", "here's how", "it looks",
    "will make"
  ].freeze

  KEY_PRONOUNS = [
    "i", "he", "she", "you", "my", "you'll", "me", "yours", "your", "you're",
    "mine", "their"
  ].freeze

  def create_vector(headline)
    [
      MULTIPLIER,
      check_first_word(headline),
      count_key_words(headline),
      count_number_occurences(headline),
      count_key_phrases(headline) + count_the_number_occurences(headline),
      count_key_pronouns(headline)
    ]
  end

  def check_first_word(headline)
    STARTING_PRONOUNS.inject(0) { |r, word| is_small_number?(headline.split(" ")) &&
      r == 0 || headline.split(' ')[0] == word ? r + 1 : r }
  end

  def count_key_words(headline)
    KEY_WORDS.inject(0) { |r, word| headline.split(" ").include?(word) ? r + 1 : r }
  end

  def count_key_phrases(headline)
    KEY_PHRASES.inject(0) { |r, phrase| headline.split(" ").include?(phrase) ? r + 1 : r }
  end

  def count_key_pronouns(headline)
    KEY_PRONOUNS.reduce(0) { |r, word| headline.split(" ").include?(word) ? r + 1 : r }
  end

  def count_number_occurences(headline)
    headline.scan(/\d+/).count
  end

  def is_i?(string)
    /\A[-+]?\d+\z/ === string
  end

  def count_the_number_occurences(headline)
    the_arr = headline.split(" ").each_index.select { |i| headline.split(" ")[i] == 'the' }
    the_arr.inject(0) { |r, item| is_i?(headline.split(" ")[item + 1]) ? r + 1 : r }
  end

  def is_small_number?(string)
    string[0].to_i != 0 && string[0].to_i < 50
  end
end
