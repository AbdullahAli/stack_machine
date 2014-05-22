module StackMachine
  class Stack < Array
    def process_integer(character)
      push(character.to_i)
    end

    def add
      apply_operator(:+)
    end

    def multiply
      apply_operator(:*)
    end

    private

    def apply_operator(operator)
      push(pop(2).inject(operator))
    end
  end
end
