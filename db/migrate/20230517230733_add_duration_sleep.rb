class AddDurationSleep < ActiveRecord::Migration[7.0]
  def change
    add_column :sleeps,:duration, :integer
  end
end
