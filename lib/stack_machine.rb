require './lib/parser'
require './lib/stack'

module StackMachine
  class Machine
    include ::StackMachine::Parser
    attr_accessor :stack
    attr_accessor :input

    OPERATOR_SIGN_TO_OPERATOR_NAME_MAP = {'+' => 'addition', '*' => 'multiplication'} unless defined?(OPERATOR_SIGN_TO_OPERATOR_NAME_MAP)

    def stack_machine_emulator(s)
      @input = s
      if valid_input?
        puts "character\t|  comment\t\t\t\t|  stack\t"
        process
      else
        -1
      end
    end

    private

    def process
      @stack = ::StackMachine::Stack.new
      puts "\t\t\t\t\t\t\t|  [empty]" if @stack.empty?

      @input.each_char do |char|
        print "'#{char}'\t\t|"
        if is_operator?(char)
          puts "perform #{OPERATOR_SIGN_TO_OPERATOR_NAME_MAP[char]}\t\t\t|  "
          @stack.send("process_#{OPERATOR_SIGN_TO_OPERATOR_NAME_MAP[char]}".to_sym)
        else
          puts "push #{char} onto the stack\t\t\t|  "
          @stack.process_integer(char)
        end
        puts "\t\t\t\t\t\t\t|  #{@stack.inspect}"
      end
      @stack
    end

    def is_operator?(char)
      ALLOWED_OPERATORS.include?(char)
    end
  end
end
