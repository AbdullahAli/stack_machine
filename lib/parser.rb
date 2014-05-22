module StackMachine
  module Parser
    ALLOWED_OPERATORS = ['+', '*'] unless defined?(ALLOWED_OPERATORS)
    ALLOWED_INTEGERS = (0..9).to_a.map!(&:to_s) unless defined?(ALLOWED_INTEGERS)
    ALLOWED_CHARACTERS = (ALLOWED_OPERATORS + ALLOWED_INTEGERS) unless defined?(ALLOWED_CHARACTERS)

    def valid_input?
      !empty_input? && starts_with_integer? && !has_invalid_characters? && !has_consecutive_operators? && has_more_integers_than_operators?
    end

    private

    def empty_input?
      @input.empty?
    end

    def starts_with_integer?
      Integer(@input.chars.first)
      true
    rescue ArgumentError
      false
    end

    def has_invalid_characters?
      invalid_characters = @input.chars - ALLOWED_CHARACTERS
      invalid_characters.any?
    end

    def has_consecutive_operators?
      @input.chars.each_cons(2) do |character_pair|
        (character_pair.first == character_pair.last) && ALLOWED_OPERATORS.include?(character_pair.first)
      end
    end

    def has_more_integers_than_operators?
      operators_count = @input.count(ALLOWED_OPERATORS.join)
      integers_count = @input.length - operators_count
      integers_count > operators_count
    end
  end
end
