module StackMachine
  class Stack < Array
    def process_addition
      apply_operator(:+)
    end

    def process_multiplication
      apply_operator(:*)
    end

    def process_integer(character)
      push(character.to_i)
    end

    private

    def apply_operator(operator)
      push(pop(2).inject(operator))
    end
  end
end
