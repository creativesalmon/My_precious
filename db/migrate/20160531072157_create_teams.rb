class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      
      t.string :name
      t.text   :intro_text
      t.text   :team_img, default:"team_default.jpg"
      t.integer   :school_id
        t.text :deadline

      t.timestamps null: false
    end
  end
end
