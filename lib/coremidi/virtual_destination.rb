module CoreMIDI
  class VirtualDestination < Source
    def connect(name = "ffi core midi virtual destination")
      enable_client
      initialize_destination(name)
      initialize_buffer
      @sysex_buffer = []
      @start_time = Time.now.to_f
    end

    def initialize_destination(name)
      @callback = get_event_callback
      endpoint = API.create_midi_destination(@client, @resource_id, name, @callback)
      @handle = endpoint[:endpoint]
      raise "MIDIDestinationCreate returned error code #{endpoint[:error]}" unless endpoint[:error].zero?
      true
    end

    def flush
      error = API.MIDIFlushOutput(@handle)
    end
  end
end
