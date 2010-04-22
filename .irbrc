
require 'rubygems'
require 'pp'

begin
  
  require 'looksee/shortcuts'

  require 'irb'
  require 'irb/completion'
  require 'irb/ext/save-history'
  ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
  # 25 entries in the list
  IRB.conf[:SAVE_HISTORY] = 100
  # Store results in home directory with specified file name
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
rescue
  puts "irbrc error"
  puts $!
  # puts $!.stacktrace
end

def _rr
  require 'rr'
  extend(RR::Adapters::RRMethods)
end  


# hacks to get history to work..
# at_exit do
#   IRB::HistorySavingAbility.create_finalizer.call
# end

# require 'bond'
# require 'bond/completion'


# require 'wirble'
# Wirble.init
# Wirble.colorize

# ARGV.concat [ "--readline",
#               "--prompt-mode",
#               #"simple"
#               ]


