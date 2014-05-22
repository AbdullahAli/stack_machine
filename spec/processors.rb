require 'spec_helper'
require './lib/stack.rb'
require './lib/processors.rb'

class TesterClass
  include StackMachine::Processors
  attr_accessor :stack

  def initialize
    @stack = StackMachine::Stack.new
  end
end

describe StackMachine::Processors::Integer do
  it "should attempt to process the integer character" do
    tester = TesterClass.new
    character = '1'
    integer_processor = StackMachine::Processors::Integer.new
    tester.stack.should_receive(:process_integer).with(character)
    integer_processor.process(tester.stack, character)
  end
end

describe StackMachine::Processors::Multiplication do
  it "should attempt to process the multiplication character" do
    tester = TesterClass.new
    character = '*'
    addition_processor = StackMachine::Processors::Multiplication.new
    tester.stack.should_receive(:multiply)
    addition_processor.process(tester.stack, character)
  end
end

describe StackMachine::Processors::Addition do
  it "should attempt to process the addition character" do
    tester = TesterClass.new
    character = '+'
    addition_processor = StackMachine::Processors::Addition.new
    tester.stack.should_receive(:add)
    addition_processor.process(tester.stack, character)
  end
end
