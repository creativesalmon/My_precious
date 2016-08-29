class CreateBNums < ActiveRecord::Migration
  def change
    create_table :b_nums do |t|
      t.integer :count
      t.integer :st
      t.integer :et
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
