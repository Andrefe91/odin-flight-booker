class AddOriginToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :origin, :string
    add_column :bookings, :destination, :string
    add_column :bookings, :duration, :integer
  end
end
