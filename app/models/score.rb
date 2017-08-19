class Score < ApplicationRecord

  STARTING_PRONOUNS = ["He", "She", "I", "It", "You", "My", "It's", "They", "They'll", "He'll", "She'll", "You'll"]
  KEY_WORDS = ["sex", "things", "number", "you'll", "these", "believe", "tips", "tweets", "never", "photos", "photo", "best", "make", "just"]
  KEY_PHRASES = ["here's why", "here's what", "you'll never", "that will", "this is", "how to", "the most", "what this", "when you", "and it's",
                  "wait till", "this guy", "blow your", "the reason", "make you", "looks like", "pictures of"]


  def self.parse(score_params)
    # TODO: Parser logic goes here - current return is just for testing
    [1, 1]
  end



end
