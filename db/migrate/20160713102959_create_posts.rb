class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text            :tag, default: ""
      t.text            :name
      t.text            :content
      t.integer         :user_id
      t.integer         :team_id
      t.text            :time
      t.string          :image_url,  default: ""
      t.timestamps null: false
    end
  end
end
