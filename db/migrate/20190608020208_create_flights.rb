class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.datetime :departure
      t.datetime :arrival
      t.string :destination
      t.decimal :baggage
      t.integer :capacity

      t.timestamps
    end
  end
end
