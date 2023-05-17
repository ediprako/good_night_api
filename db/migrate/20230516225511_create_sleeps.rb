class CreateSleeps < ActiveRecord::Migration[7.0]
  def change
    create_table :sleeps do |t|
      t.references :user, null: false
      t.date :date, null: false
      t.datetime :clock_in
      t.datetime :clock_out
      t.timestamps
    end
  end
end
