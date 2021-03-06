module StackMachine
  class Parser
    ALLOWED_OPERATORS = ['+', '*'] unless defined?(ALLOWED_OPERATORS)
    ALLOWED_INTEGERS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] unless defined?(ALLOWED_INTEGERS)
    ALLOWED_CHARACTERS = (ALLOWED_OPERATORS + ALLOWED_INTEGERS) unless defined?(ALLOWED_CHARACTERS)

    def initialize(input)
      @input = input
    end

    def valid_input?
      !empty_input? && starts_with_integer? && !has_invalid_characters? && has_more_integers_than_operators?
    end

    private

    def empty_input?
      @input.empty?
    end

    def starts_with_integer?
      ALLOWED_INTEGERS.include?(@input.chars.first)
    end

    def has_invalid_characters?
      invalid_characters = @input.chars - ALLOWED_CHARACTERS
      invalid_characters.any?
    end

    def has_more_integers_than_operators?
      operators_count = @input.count(ALLOWED_OPERATORS.join)
      integers_count = @input.length - operators_count
      integers_count > operators_count
    end
  end
end
