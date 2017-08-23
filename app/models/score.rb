require_dependency 'perceptron'

class Score < ApplicationRecord
  include ScoreHelper
  include MachineLearningHelper

  def parse(score_params)
    raise "invalid query string" unless verify_params(score_params["title"])
    vector = create_vector(score_params['title'])
    update_attributes(vector: vector)
    update_attributes(result: predict(Vector[*vector]))
  end

  private

  def predict(vector)
    perceptron = Perceptron.new(5)
    perceptron.predict(vector)
  end
end
