class Client < ApplicationRecord
  validates :name, :email, :phone_number, :age, presence: :true
end
