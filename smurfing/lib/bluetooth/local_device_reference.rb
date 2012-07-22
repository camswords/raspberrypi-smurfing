
module Bluetooth
  class LocalDeviceReference

    attr_reader :interface_name

    def initialize(interface_name)
      @interface_name = interface_name
    end
  end
end
