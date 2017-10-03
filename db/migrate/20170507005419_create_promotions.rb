class CreatePromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :promotions do |t|
      t.string :Title
      t.string :Description
      t.string :ImagePath
      t.date :StartDate
      t.date :EndDate

      t.timestamps
    end
  end
end
