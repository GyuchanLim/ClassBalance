class Client < ApplicationRecord
  validates :name, :email, :phone_number, :age, presence: :true

  has_and_belongs_to_many :appointments
end
