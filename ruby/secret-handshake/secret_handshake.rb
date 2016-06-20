class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump']
  attr_reader :commands

  def initialize(input)
    seq = input.is_a?(String)? input.to_i(2) : input
    # @commands = COMMANDS.each_with_index.each_with_object([]) { |(cmd, i), arr| arr << cmd if (seq & (1 << i)) > 0 }
    @commands = COMMANDS.each_index.each_with_object([]) { |k, cmds| cmds << COMMANDS[k] if (seq >> k) & 1 > 0 }
    @commands.reverse! unless seq < 0b10000
  end
end