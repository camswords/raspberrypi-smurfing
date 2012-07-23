require 'lib/bluetooth/remote_device_reference'
require 'open3'

module Bluetooth
  class Radar

    def self.scan
      stdin, stdout, stderr = Open3.popen3("hcitool scan |  grep ':' | awk '{print $1}'")

      result_macs = stdout.readlines
      error = stderr.readlines

      if !error.empty?
        raise "failed to scan for remote bluetooth devices. Exited with error code #{$?}, error was #{error}"
      end

      result_macs.collect { |mac| RemoteDeviceReference.new(mac.chomp()) }
    end
  end
end
