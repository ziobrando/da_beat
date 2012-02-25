$:.unshift File.join(File.dirname(__FILE__), "../..", "lib")

require "rspec"

require "activities/activity"
require "activities/job"
require "clock/clock"

describe "execution" do

  it "should do something" do
    job = Job.new
    activity = Activity.new "test activity", 20, job  # TODO temporary
    clock = Clock.new 100,5
    clock.add_listener activity

    clock.start

    activity.completed?.should == true
  end

  it "should notify upon start" do
    job = Job.new
    activity = Activity.new "test activity", 20, job
    clock = Clock.new 15,5
    clock.add_listener activity

    class Bus
      attr_reader :event
      def publish event
        @event = event
      end
    end

    bus = Bus.new
    activity.add_event_listener bus

    clock.start

    bus.event.type.should == "ActivityStarted"
  end

  it "should notify upon completion" do
    job = Job.new
    activity = Activity.new "test activity", 20, job
    clock = Clock.new 25,5
    clock.add_listener activity

    class Bus
      attr_reader :event
      def publish event
        @event = event
      end
    end

    bus = Bus.new
    activity.add_event_listener bus

    clock.start

    bus.event.type.should == "ActivityCompleted"
  end

  it "should stop after completion" do

  end


end

describe "guarded execution" do
  it "should check guarded conditions if present" do

  end


end