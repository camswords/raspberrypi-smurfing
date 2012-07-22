require 'lib/bluetooth/local_device_reference'
require 'open3'


module Bluetooth
  class LocalMachine
    def devices
      stdin, stdout, stderr = Open3.popen3("hciconfig | awk '{print $1}' | grep ':'")

      devices = stdout.readlines
      error = stderr.readlines

      if $? != 0 || devices.empty? || !error.empty?
        raise "failed to retrieve devices on local machine. Error was #{error}"
      end

      devices.each_line.collect { |device| LocalDeviceReference.new(device.chomp().chomp(':')) }
    end
  end
