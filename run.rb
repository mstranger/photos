#!/usr/bin/env ruby

require_relative "src/photos"

def show_info
  %{
  Sync two given folders (delete files in the second)
  - First folder contains jpg files
  - Second folder contains raw files

  Options:
  `-v, --verbose` print additional information
  `-h, --help` print this text

  Example: `run.rb source/path target/path -v`
  }.rstrip
end

options = {}
options[:verbose] = true if ARGV.include?("-v") or ARGV.include?("--verbose")

if ARGV.include?("-h") or ARGV.include?("--help")
  puts show_info
else
  src = ARGV[0]
  target = ARGV[1]

  Photos.new(src, target, options).sync if src && target
end

