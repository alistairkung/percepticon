class ScoresController < ApplicationController
  def new
    @thing = Score.new
    @thing.vector = Score.parse(score_params) # TODO: turn input into vector
    @thing.result = 1 # TODO: use perceptron to score vector
    render json: { score: @thing.result }, status: :ok
  end

  private

  def score_params
    params.permit(:title)
  end
end
