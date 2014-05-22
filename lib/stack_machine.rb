require './lib/parser'
require './lib/stack'
require './lib/processors'

module StackMachine
  class Machine
    include ::StackMachine::Parser
    include ::StackMachine::Processors
    attr_accessor :stack
    attr_accessor :input

    OPERATOR_SIGN_TO_PROCESSOR_MAP = {'+' => 'Addition', '*' => 'Multiplication'} unless defined?(OPERATOR_SIGN_TO_PROCESSOR_MAP)

    def stack_machine_emulator(s)
      @input = s
      if valid_input?
        process
      else
        -1
      end
    end

    private

    def process
      @stack = ::StackMachine::Stack.new

      @input.each_char do |character|
        processor_for(character).process(@stack, character)
      end
      @stack
    end

    def processor_for(character)
      if is_operator?(character)
        processor = "StackMachine::Processors::#{OPERATOR_SIGN_TO_PROCESSOR_MAP[character]}"
      else
        processor = "StackMachine::Processors::Integer"
      end
      StackMachine.const_get(processor).new
    end
  end
end
