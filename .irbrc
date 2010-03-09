require 'rubygems'
require 'looksee/shortcuts'

require 'irb'
require 'irb/completion'
require 'irb/ext/save-history'

require 'irb'

require 'pp'
# hacks to get history to work..
at_exit do
  IRB::HistorySavingAbility.create_finalizer.call
end

# require 'bond'
# require 'bond/completion'

require 'irb/completion'

require 'wirble'
Wirble.init
Wirble.colorize

# ARGV.concat [ "--readline",
#               "--prompt-mode",
#               #"simple"
#               ]

# 25 entries in the list
IRB.conf[:SAVE_HISTORY] = 100

# Store results in home directory with specified file name
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"


def _rr
  require 'rr'
  extend(RR::Adapters::RRMethods)
end
