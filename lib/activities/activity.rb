require "bus/event_publisher"
require "events/activity_started"
require "events/activity_completed"

class Activity

  include EventPublisher

  def initialize name, duration, job
    @name = name
    @duration = duration
    @progress = 0
    @started = false
    @completed = false
    @job = job
  end

  def tick tick
    if not started?
      start tick
    end
    proceed tick
    if just_completed?
      finish tick
    end
  end

  def started?
    @started
  end

  def start tick
    set_started_status
    @job.start
    publish ActivityStarted.new @job, tick.time
  end

  def proceed tick
    @progress += tick.step
    #TODO Mah
    puts "Time: #{tick.time}, completed #{@progress} of #{@duration}"
  end

  def finish tick
    @completed = true
    puts "Activity #{@name} completed at #{tick.time}"
    publish ActivityCompleted.new @job, tick.time
  end

  def completed?
    @completed
  end

  def just_completed?
    @progress >= @duration and not @completed
  end

  def set_started_status
    @started = true
  end
  private :set_started_status
end

