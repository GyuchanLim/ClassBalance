# This will remove a single client from the appointment
# Things to consider - what happens when there are no clients in the appointment?
class Appointment
  class RemoveClient
    def initialize(client, appointment)
      @client = client
      @appointment = appointment
    end

    def call
      if @client.appointments.include?(@appointment)
        ServiceResult.new(@appointment.remove_client(@client))
      else
        ServiceResult.failure("unable to remove client #{@client.name} from #{@appointment.to_s}")
      end
    end
  end
end
