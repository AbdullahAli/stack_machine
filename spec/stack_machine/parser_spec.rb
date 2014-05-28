require 'spec_helper'
require 'stack_machine/parser'

describe StackMachine::Parser do

  describe "#valid_input?" do
    context "valid inputs" do
      ["13+62*7+*", "11+", "01+4+", "001+4++"].each do |valid_input|
        it "should return true since the input is '#{valid_input}'" do
          parser = StackMachine::Parser.new(valid_input)
          parser.valid_input?.should be_true
        end
      end
    end

    context "invalid inputs" do
      [
        "",     # empty input
        "+",    # does not start with integer
        "g1",   # has invalid characters
        "11+++" # does not have more integers than operators
      ].each do |invalid_input|
        it "should return false since the input is '#{invalid_input}'" do
          parser = StackMachine::Parser.new(invalid_input)
          parser.valid_input?.should be_false
        end
      end
    end
  end
end
