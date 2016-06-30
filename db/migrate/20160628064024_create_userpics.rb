class CreateUserpics < ActiveRecord::Migration
  def change
    create_table :userpics do |t|
      t.integer  :user_id
      t.text     :profile_img
      t.integer  :main
      
      
      t.timestamps null: false
    end
  end
end
