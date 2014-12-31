module CoreMIDI
  class VirtualDestination < Source
    def connect
      enable_client
      initialize_destination
      initialize_buffer
      @sysex_buffer = []
      @start_time = Time.now.to_f
    end

    def initialize_destination
      @callback = get_event_callback
      endpoint = API.create_midi_destination(@client, @resource_id, "midi router", @callback)
      @handle = endpoint[:endpoint]
      raise "MIDIDestinationCreate returned error code #{endpoint[:error]}" unless endpoint[:error].zero?
      true
    end
  end
end
