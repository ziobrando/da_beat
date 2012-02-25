$:.unshift File.join(File.dirname(__FILE__), "../..", "lib")

require "rspec"

require "clock/clock"

describe "Tick" do

  it "should tick at a given interval" do

  end

  it "should accept listeners" do
    clock = Clock.new 20,5
    listener = MockListener.new
    clock.add_listener listener
    clock.start

    listener.count.should == 4
  end

  it "should accept multiple listeners" do
    clock = Clock.new 50,5
    listener_a = MockListener.new
    listener_b = MockListener.new
    clock.add_listener listener_a
    clock.add_listener listener_b
    clock.start

    listener_a.count.should == 10
    listener_b.count.should == 10
  end
end

class MockListener
  attr_reader :count
  def initialize
    @count = 0
  end

  def tick time
    @count+=1
  end
  #include ClockListener
end