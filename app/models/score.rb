require_dependency 'perceptron'

class Score < ApplicationRecord
  include ScoreHelper

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

  def parse(score_params)
    raise "invalid query string" unless verify_params(score_params["title"])
    vector = create_vector(score_params['title'])
    update_attributes(vector: vector)
    update_attributes(result: predict(Vector[*vector]))
  end

  private

  def create_vector(headline)
    [
      MULTIPLIER,
      first_word(headline),
      key_words(headline),
      number_occurences(headline),
      key_phrases(headline) + the_and_number(headline),
      key_pronouns(headline)
    ]
  end

  def first_word(headline)
    STARTING_PRONOUNS.inject(0) { |r, w| headline.downcase.split(" ")[0].to_i != 0 &&
    headline.downcase.split(" ")[0].to_i < 50 &&
    r == 0 || headline.downcase.split(' ')[0] == w ? r + 1 : r }
  end

  def key_words(headline)
    KEY_WORDS.inject(0) { |r, word| headline.downcase.split(" ").include?(word) ? r + 1 : r }
  end

  def key_phrases(headline)
    KEY_PHRASES.inject(0) { |r, phrase| headline.downcase.split(" ").include?(phrase) ? r + 1 : r }
  end

  def key_pronouns(headline)
    KEY_PRONOUNS.reduce(0) { |r, word| headline.downcase.split(" ").include?(word) ? r + 1 : r }
  end

  def number_occurences(headline)
    headline.scan(/\d+/).count
  end

  def is_i?(string)
    /\A[-+]?\d+\z/ === string
  end

  def the_and_number(headline)
    the_arr = headline.downcase.split(" ").each_index.select{|i| headline.downcase.split(" ")[i] == 'the'}
    the_arr.inject(0){|r, item| is_i?(headline.downcase.split(" ")[item + 1]) ? r + 1 : r }
  end

  def predict(vector)
    perceptron = Perceptron.new(5)
    perceptron.predict(vector)
  end
end
