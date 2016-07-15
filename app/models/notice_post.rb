class NoticePost < ActiveRecord::Base
    belongs_to :user
    has_many :notice_replies
end
