class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|

      t.integer :schedule_id
      t.integer :user_id
      t.integer :status  # 0: 불참석 1: 참석 2: 지각 3:(default 값)
      
      t.timestamps null: false
    end
  end
end
