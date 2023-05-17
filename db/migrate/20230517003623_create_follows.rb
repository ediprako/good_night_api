class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.references :from_user,null: false, foreign_key: {to_table: :users}
      t.references :to_user,null: false, foreign_key: {to_table: :users}
      t.timestamps

      t.index [:from_user_id,:to_user_id], unique:true
    end
  end
end
