class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.integer :adress
      t.string :street
      t.string :city
      t.string :state
      t.integer :ZipCode

      t.timestamps
    end
  end
end
