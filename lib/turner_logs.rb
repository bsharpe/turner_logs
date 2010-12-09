=begin
  Add colors to logger statements
  
  e.g.
    Rails.logger.debug "<b>This <c!>is <g>a <G>test"
    
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
=end

module ActiveSupport
  class BufferedLogger

    def add(severity, message = nil, progname = nil, &block)
      return if @level > severity
      message = (message || (block && block.call) || progname).to_s
      message = colorize_message(message)
      # If a newline is necessary then create a new message ending with a newline.
      # Ensures that the original message is not mutated.
      message = "#{message}\n" unless message[1] == "\n"
      buffer << message
      auto_flush
      message
    end
    
  private
    def colorize_message(message)
      return if message.blank?
      message.gsub!(/<([a-zA-Z!]*)[\/]*>/) {|color| color_to_code($1)}
      message << color_to_code('Z') # always reset at the end of each line
     end

    @@_color_map = {
      'k' => 30, 'K' => 40,
      'r' => 31, 'R' => 41,
      'g' => 32, 'G' => 42,
      'y' => 33, 'Y' => 43,
      'b' => 34, 'B' => 44,
      'm' => 35, 'M' => 45,
      'c' => 36, 'C' => 46,
      'w' => 37, 'W' => 47,
      '!' => 1
    }
    def color_to_code(color)
      "\e[0;#{color.split('').map{|c| @@_color_map[c]}.compact.join(';')}m"
    end
  end
end