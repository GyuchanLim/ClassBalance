class AppointmentPresenter
  attr_reader :appointment

  def self.present_appointment(appointment)
    datetime = appointment.datetime

    {
      datetime: datetime,
      year: datetime.year,
      month: datetime.month,
      day: datetime.day,
      hour: datetime.strftime("%I").to_i,
      am_pm: datetime.strftime("%p"),
      min: datetime.min,
      clients: self.list_clients(appointment.clients)
    }
  end

  def self.list_clients(clients)
    clients.map { |client| client.name }
  end

  def initialize(appointment)
    @appointment = appointment
  end
end
