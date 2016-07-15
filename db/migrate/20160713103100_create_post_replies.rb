class CreatePostReplies < ActiveRecord::Migration
  def change
    create_table :post_replies do |t|
      t.text            :content
      t.integer         :user_id
      t.integer         :post_id
      t.timestamps null: false
    end
  end
end
