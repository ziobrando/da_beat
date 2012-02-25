require "clock/tick"

class Clock

  def initialize counter, interval
    @upto = counter
    @step = interval
    @current = 0
    @listeners = []
  end

  def add_listener listener
    @listeners << listener
  end

  def start
    while @current < @upto
      increment_counter
      notify_listeners
    end
  end

  def increment_counter
    @current += @step
  end

  def notify_listeners
    @listeners.each {
      |listener| listener.tick time
    }
  end

  def time
    Tick.new @current, @step
  end

end