class NoticeReply < ActiveRecord::Base
    belongs_to :user
    belongs_to :notice_post
end
