require 'spec_helper'
require 'stack_machine'

describe StackMachine::Machine do

  describe "#stack_machine_emulator" do
    before(:each) do
      @stack_machine = StackMachine::Machine.new
    end

    context "valid input" do

      it "should set the input attribute to the user supplied input" do
        ["13+62*7+*", "11+", "01+4+"].each do |valid_input|
          @stack_machine.stub(:valid_input?).and_return(true)
          @stack_machine.stack_machine_emulator(valid_input)
          @stack_machine.input.should == valid_input
        end
      end

      it "should attempt to process the input" do
        @stack_machine.should_receive(:process)
        @stack_machine.stack_machine_emulator("13+62*7+*")
      end

      it "should return the expected value" do
        {
          "13+62*7+*" => [76],
          "11+" => [2],
          "01+4+" => [5],
          "001+4+" => [0, 5]
        }.each do |input, expected_output|
          @stack_machine.stack_machine_emulator(input).should == expected_output
        end
      end
    end

    context "invalid input" do
      it "should return '-1' for all types of errors" do
        [
          "",     # empty input
          "+",    # does not start with integer
          "g1",   # has invalid characters
          "1++",  # has consecutive operators
          "11+++" # does not have more integers than operators
        ].each do |invalid_input|
          @stack_machine.stack_machine_emulator(invalid_input).should == -1
        end
      end
    end
  end
end
