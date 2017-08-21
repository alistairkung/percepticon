class Score < ApplicationRecord
  MULTIPLIER = 1
  STARTING_PRONOUNS = [
    'He', 'She', 'I', 'It', 'You', 'My', "It's", 'They', "They'll", "He'll",
    "She'll", "You'll"
  ].freeze

  KEY_WORDS = [
    'sex', 'things', 'number', "you'll", 'these', 'believe', 'tips',
    'tweets', 'never', 'photos', 'photo', 'best', 'make', 'just'
  ].freeze

  KEY_PHRASES = [
    "here's why", "here's what", "you'll never", 'that will', 'this is',
    'how to', 'the most', 'what this', 'when you', "and it's",
    'wait till', 'this guy', 'blow your', 'the reason', 'make you',
    'looks like', 'pictures of'
  ].freeze

  def parse(score_params)
    update_attributes(vector: create_vector(score_params['title']))
    update_attributes(result: 1) # TODO: Perceptron predict method called here
  end

  private

  def create_vector(headline)
    [
      MULTIPLIER,
      first_word(headline),
      key_words(headline) + number_occurences(headline),
      key_phrases(headline)
    ]
  end

  def first_word(headline)
    STARTING_PRONOUNS.inject(0) { |r, w| headline.split(' ')[0].to_i != 0 && r.zero? || headline.split(' ')[0] == w ? r + 1 : r }
  end

  def key_words(headline)
    KEY_WORDS.inject(0) { |r, word| headline.downcase.include?(word) ? r + 1 : r }
  end

  def key_phrases(headline)
    KEY_PHRASES.inject(0) { |r, phrase| headline.downcase.include?(phrase) ? r + 1 : r }
  end

  def number_occurences(headline)
    headline.scan(/\d+/).count
  end
end
