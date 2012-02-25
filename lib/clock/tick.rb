class Tick
  
  attr_reader :time
  attr_reader :step
  def initialize time, step
    @time = time
    @step = step
  end
end