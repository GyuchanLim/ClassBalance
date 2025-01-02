class Appointment < ApplicationRecord
  # TODO - Usability
  # Separate time column to date and time columns
  # This allows user to fix to a certain year or months

  # TODO - Functionality
  # Restrict creating appointment with same date and time

  validates :time, presence: :true
  has_and_belongs_to_many :clients

  def present
    self.time.strftime("%Y-%m-%d %H:%M")
  end

  def enroll(client_ids)
    self.clients = client_ids.map { |client_id| Client.find(client_id) }
  end

  def remove_client(client)
    self.clients.delete(client)
  end
end
