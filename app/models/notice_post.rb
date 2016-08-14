class NoticePost < ActiveRecord::Base
    belongs_to :user
    belongs_to :team
    has_many :notice_replies
end
