class Score < ApplicationRecord
  include ScoreHelper
  include ParsingHelper

  def parse(score_params)
    raise "invalid query string" unless valid_title?(score_params["title"])
    vector = create_vector(score_params['title'].downcase)
    update_attributes(vector: vector)
    update_attributes(result: predict(Vector[*vector]))
  end
end
