class Appointment < ApplicationRecord
  # TODO - Usability

  # Separate time column to date and time columns
  # This allows user to fix to a certain year or months
  validates :time, presence: :true
  has_and_belongs_to_many :clients

  def present
    self.time.strftime("%Y-%m-%d %H:%M")
  end

  def add_clients_to_appointment(cleaned_up_clients_list)
    cleaned_up_clients_list.as_json.values.uniq.compact.each do |client_id|
      self.clients << Client.find(client_id)
    end
  end

  def remove_client(client)
    self.clients.delete(client)
  end
end
