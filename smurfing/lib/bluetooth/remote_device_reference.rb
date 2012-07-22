
module Bluetooth
  class RemoteDeviceReference

    attr_reader :mac_address

    def initialize(mac_address)
      @mac_address = mac_address
    end

  end
end
