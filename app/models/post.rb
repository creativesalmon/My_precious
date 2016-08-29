class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :team
    has_many   :post_replies
    has_many   :favorites
    
   
    validates :content, presence: true
end
