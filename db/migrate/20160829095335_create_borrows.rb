class CreateBorrows < ActiveRecord::Migration
  def change
    create_table :borrows do |t|
       t.text     :content
      t.integer  :weight
      t.timestamps null: false
    end
  end
end
