module ScoreHelper
  BIAS = -2
  DEFAULT_WEIGHTS = [BIAS, 2, 2, 2, 2, 2]
  VECTOR_DIMENSIONS = 5

  def valid_title?(title)
    title.is_a?(String) && !title.empty? && title[0] != " "
  end

  def predict(vector)
    Perceptron.create(VECTOR_DIMENSIONS)
    Perceptron.set_weight(DEFAULT_WEIGHTS)
    Perceptron.predictp(vector)
  end
end
