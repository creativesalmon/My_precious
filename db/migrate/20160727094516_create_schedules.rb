class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.string :position
      t.text :date
      t.text :time
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
