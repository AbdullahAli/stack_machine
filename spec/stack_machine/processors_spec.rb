require 'spec_helper'
require 'stack_machine/stack'
require 'stack_machine/processors'

describe StackMachine::Processors::Integer do
  it "should attempt to process the integer character" do
    stack = StackMachine::Stack.new
    processor = StackMachine::Processors::Integer.new(stack)

    input_character = '1'
    stack.should_receive(:process_integer).with(input_character)

    processor.process(input_character)
  end
end

describe StackMachine::Processors::Multiplication do
  it "should attempt to process the multiplication character" do
    stack = StackMachine::Stack.new
    processor = StackMachine::Processors::Multiplication.new(stack)

    input_character = '*'
    stack.should_receive(:multiply)

    processor.process(input_character)
  end
end

describe StackMachine::Processors::Addition do
  it "should attempt to process the addition character" do
    stack = StackMachine::Stack.new
    processor = StackMachine::Processors::Addition.new(stack)

    input_character = '*'
    stack.should_receive(:add)

    processor.process(input_character)
  end
end
