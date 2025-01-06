class RenameTimeToDatetime < ActiveRecord::Migration[8.0]
  def change
    rename_column :appointments, :time, :datetime
  end
end