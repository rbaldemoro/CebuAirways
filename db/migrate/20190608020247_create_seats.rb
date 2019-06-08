class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.string :name
      t.decimal :baggage
      t.integer :flight_id

      t.timestamps
    end
  end
end
