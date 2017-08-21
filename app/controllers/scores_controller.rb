class ScoresController < ApplicationController
  include ScoreHelper
  def new
    if verify_params(score_params['title'])
      @score = Score.new
      @score.parse(score_params)
      render json: @score, status: :ok
    else
      render json: {message: "invalid query string"}, status: :error
    end
  end

  private

  def score_params
    params.permit(:title)
  end
end
