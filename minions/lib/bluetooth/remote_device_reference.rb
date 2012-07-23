require 'open3'

module Bluetooth
  class RemoteDeviceReference

    attr_reader :mac_address

    def initialize(mac_address)
      @mac_address = mac_address
    end

    def about
      stdin, stdout, stderr = Open3.popen3("hcitool info #{@mac_address}")

      about = stdout.readlines
      error = stderr.readlines

      if !error.empty?
        raise "failed to retrieve more information about device with mac #{@mac_address}. Error was #{error}"
      end

      about
    end

  end
end
