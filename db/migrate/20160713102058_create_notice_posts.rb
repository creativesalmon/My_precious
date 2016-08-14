class CreateNoticePosts < ActiveRecord::Migration
  def change
    create_table :notice_posts do |t|
      t.text            :name
      t.text            :content
      t.integer         :team_id
      t.integer         :user_id
      t.timestamps null: false
    end
  end
end
