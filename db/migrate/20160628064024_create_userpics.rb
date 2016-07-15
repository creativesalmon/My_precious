class CreateUserpics < ActiveRecord::Migration
  def change
    create_table :userpics do |t|
      t.integer  :user_id
      t.text     :profile_img
      t.boolean  :main,default:true   #main 이미지 선정
      
      
      t.timestamps null: false
    end
  end
end