require 'matrix'

class Weight
  attr_reader :vector

  INITIAL_BIAS = -2
  TRAINED_WEIGHTS = [2, 2, 2, 2, 2].freeze

  def initialize(features_number)
    @values = Array.new(TRAINED_WEIGHTS)
    @vector = vector_init(@values)
  end

  def update(values)
    @vector = Vector[*values]
  end

  private

  def vector_init(array)
    prepend_bias(array)
    Vector[*array]
  end

  def prepend_bias(array)
    array.unshift(INITIAL_BIAS)
  end
end
