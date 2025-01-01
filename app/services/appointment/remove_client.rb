# This will remove a single client from the appointment
# Things to consider - what happens when there are no clients in the appointment?
class Appointment
  class RemoveClient
    def initialize(client, appointment)
      @client = client
      @appointment = appointment
    end

    def call
      debugger
    end
  end
end
