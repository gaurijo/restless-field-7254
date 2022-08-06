class RemoveFlightIdFromPassengers < ActiveRecord::Migration[5.2]
  def change
    remove_column :passengers, :flight_id, :bigint
  end
end
