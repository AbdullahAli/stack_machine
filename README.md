# StackMachine

## How I went about doing this task
1. V1 (before feedback): [Please refer to this document](AbdullahALI_APPROACH.pdf)
2. V2 (after feedback): [Please refer to this document](https://github.com/AbdullahAli/stack_machine/blob/8ae0030137258bb16120d56c6218cdd3aa6a24e0/AbdullahALI_APPROACH_V2.pdf?raw=true)

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
