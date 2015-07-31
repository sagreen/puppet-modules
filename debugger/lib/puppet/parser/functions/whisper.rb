module Puppet::Parser::Functions
  newfunction(:whisper, :type => :rvalue, :doc => <<-EOS
              Takes one argument, a string, and returns an all lowercase
              copy of the string.
              EOS
             ) do |args|
               raise(Puppet::ParseError, "whisper(): Wrong # of args" +
                     "given (#{args.size} for 1)") if args.size != 1
               args[0].downcase
             end
end
