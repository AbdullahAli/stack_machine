# StackMachine

## How I went about doing this task
1. V1: [Please refer to this document](AbdullahALI_APPROACH.pdf)

## Usage
1. Add gem to your Gemfile
    
        gem 'stack_machine', :git => 'https://github.com/AbdullahAli/stack_machine', :tag => 'v2.0'

2. Install gem

        bundle install

3. Load console

        rails c

4. Create a new Stack Machine instance

        m = StackMachine::Machine.new

5. Process input

        m.stack_machine_emulator("13+62*7+*")
