require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    if @nameable.length > 10
      @nameable[0, 10]
    else
      @nameable
    end
  end
end
