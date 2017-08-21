class ScoresController < ApplicationController
  def new
    @score = Score.new
    @score.parse(score_params)
    render json: @score, status: :ok
  end

  private

  def score_params
    params.permit(:title)
  end
end
