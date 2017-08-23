module ScoreHelper
  def valid_title?(title)
    title.is_a?(String) && !title.empty? && title[0] != " "
  end
end
