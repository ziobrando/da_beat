module EventPublisher



  def init
    @event_listeners = []
  end

  def add_event_listener event_listener
    if @event_listeners.nil?
      init
    end
    @event_listeners << event_listener
  end

  def publish event
    if @event_listeners.nil?
      return
    else
      @event_listeners.each {
          |listener| listener.publish event
      }
    end
  end
end