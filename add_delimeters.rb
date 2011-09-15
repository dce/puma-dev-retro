#!/usr/bin/env ruby

puts STDIN.read.gsub(/^#/, "!SLIDE\n\n#")
