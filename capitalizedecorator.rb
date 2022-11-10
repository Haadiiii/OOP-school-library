require './decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.upcase
  end
end
