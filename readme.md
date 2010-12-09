## Turner Logs

Colorize your B&W Rails logs

# example
  
  e.g.
    Rails.logger.debug "<b>This <c!>is <g>a <G>test"
    
# The Codex

    lowercase - font color
    uppercase - background color
  
    k => black
    r => red
    g => green
    y => yellow
    b => blue
    m => magenta
    c => cyan
    w => white
    ! => <bright/bold>

# how to use

in your Gemfile

    require 'turner_logs'
    
that's it.

Now when you want to print out a colorized log statment, you do something like:
  
    Rails.logger.debug "<g>Everything is <Wb>OK."  