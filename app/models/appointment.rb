class Appointment < ApplicationRecord
  validates :time, presence: :true
  has_and_belongs_to_many :clients
end
