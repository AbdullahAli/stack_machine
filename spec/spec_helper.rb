require 'bundler/setup'
Bundler.setup
RSpec.configure do |config|
  config.before(:all, &:silence_output)
end

public
# Redirects stderr and stdout to /dev/null.
def silence_output
  $orig_stderr = $stderr
  $orig_stdout = $stdout

  # redirect stderr and stdout to /dev/null
  $stderr = File.new('/dev/null', 'w')
  $stdout = File.new('/dev/null', 'w')
end
