class Appointment < ApplicationRecord
  # TODO - Usability

  # Separate time column to date and time columns
  # This allows user to fix to a certain year or months
  validates :time, presence: :true
  has_and_belongs_to_many :clients

  def present
    self.time.strftime("%Y-%m-%d %H:%M")
  end
end
