require 'spec_helper'
require './lib/stack.rb'

describe StackMachine::Stack do
  before(:all) do
    @stack = StackMachine::Stack.new
  end

  describe "#add" do
    it "should attempt to apply the operator '+'" do
      @stack.should_receive(:apply_operator).with(:+)
      @stack.add
    end
  end

  describe "#multiply" do
    it "should attempt to apply the operator '*'" do
      @stack.should_receive(:apply_operator).with(:*)
      @stack.multiply
    end
  end

  describe "#process_integer" do
    before(:each) do
      @stack = StackMachine::Stack.new
    end

    (0..9).to_a.each do |integer|
      it "should push the integer '#{integer}' to the stack" do
        @stack.count.should == 0
        @stack.process_integer(integer)
        @stack.count.should == 1
        @stack.first.should == integer
      end
    end
  end
end
