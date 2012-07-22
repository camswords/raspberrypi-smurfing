#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)

require 'lib/bluetooth/radar'

if $0 == __FILE__

  if ARGV.length == 0
    puts "usage: #{$0} scan\n\n"
    exit 1
  end

  remote_device_refs = Bluetooth::Radar.scan
  remote_device_refs.each { |device| puts device }

end
