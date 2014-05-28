require 'stack_machine/parser'
require 'stack_machine/processors'
require 'stack_machine/stack'

module StackMachine
  class Machine
    attr_accessor :input
    attr_accessor :stack

    def stack_machine_emulator(s)
      parser = StackMachine::Parser.new(s)

      if parser.valid_input?
        @input = s
        process
      else
        -1
      end
    end

    private

    def process
      @stack = ::StackMachine::Stack.new

      @input.each_char do |character|
        processor_for(character).process(character)
      end
      @stack
    end

    def processor_for(character)
      if character =~ /^[+]$/
        StackMachine::Processors::Addition.new(@stack)
      elsif character =~ /^[*]$/
        StackMachine::Processors::Multiplication.new(@stack)
      elsif character =~ /^[0123456789]$/
        StackMachine::Processors::Integer.new(@stack)
      end
    end

  end
end
