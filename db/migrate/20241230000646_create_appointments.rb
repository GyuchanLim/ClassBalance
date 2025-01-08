class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.datetime :time

      t.timestamps
    end

    # Adding has_and_belongs_to_many relationship between clients and appointments
    create_table :appointments_clients, id: false do |t|
      t.belongs_to :appointment
      t.belongs_to :client
    end
  end
end
