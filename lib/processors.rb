module StackMachine
  module Processors

    class Integer
      def process(stack, character)
        stack.process_integer(character)
      end
    end

    class Multiplication
      def process(stack, character)
        stack.multiply
      end
    end

    class Addition
      def process(stack, character)
        stack.add
      end
    end

  end
end
