class CreatePostReplies < ActiveRecord::Migration
  def change
    create_table :post_replies do |t|
      t.text            :content
      t.integer         :post_id
      t.integer         :team_id
      t.text            :user_id
    
      t.timestamps null: false
    end
  end
end
