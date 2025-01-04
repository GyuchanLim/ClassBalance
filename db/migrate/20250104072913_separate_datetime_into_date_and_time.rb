class SeparateDatetimeIntoDateAndTime < ActiveRecord::Migration[8.0]
  def change
    add_column :appointments, :date, :date
    add_column :appointments, :hour, :integer, default: 0 # 00, 10, 20, 30, 40, 50
    add_column :appointments, :minute, :integer, default: 0 # 00, 10, 20, 30, 40, 50
  end
end
