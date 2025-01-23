class CreateSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :sessions do |t|
      t.references :movie, null: false, foreign_key: true
      t.integer :hall_number, null: false
      t.date :start_date, null: false
      t.time :start_time, null: false

      t.timestamps
    end
  end
end
