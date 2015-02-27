class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :location
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
