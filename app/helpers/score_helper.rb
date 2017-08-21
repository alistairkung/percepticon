module ScoreHelper
  def verify_params(title)
    title.is_a?(String) && !title.empty? && title[0] != " "
  end
end
