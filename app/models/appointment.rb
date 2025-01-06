class Appointment < ApplicationRecord
  # TODO - Functionality
  # Restrict creating appointment with same datetime

  validates :datetime, presence: :true
  has_and_belongs_to_many :clients

  def present
    self.datetime.strftime("%Y-%m-%d %H:%M")
  end

  def enroll(client_ids)
    self.clients = client_ids.map { |client_id| Client.find(client_id) }
  end

  def remove_client(client)
    self.clients.delete(client)
  end
end
