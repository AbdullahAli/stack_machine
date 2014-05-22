require 'spec_helper'
require './lib/parser.rb'

describe StackMachine::Parser do

  class TesterClass
    include StackMachine::Parser
    attr_accessor :input
  end

  before(:all) do
    @tester_object = TesterClass.new
  end

  describe "#valid_input?" do
    context "valid inputs" do
      ["13+62*7+*", "11+", "01+4+", "001+4++"].each do |valid_input|
        it "should return true since the input is '#{valid_input}'" do
          @tester_object.input = valid_input
          @tester_object.valid_input?.should be_true
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
          @tester_object.input = invalid_input
          @tester_object.valid_input?.should be_false
        end
      end
    end
  end
end
