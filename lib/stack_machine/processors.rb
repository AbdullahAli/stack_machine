module StackMachine
  module Processors

    class Integer
      def initialize(stack)
        @stack = stack
      end

      def process(character)
        @stack.process_integer(character)
      end
    end

    class Multiplication
      def initialize(stack)
        @stack = stack
      end

      def process(character)
        @stack.multiply
      end
    end

    class Addition
      def initialize(stack)
        @stack = stack
      end

      def process(character)
        @stack.add
      end
    end

  end
end
