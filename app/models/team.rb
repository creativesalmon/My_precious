class Team < ActiveRecord::Base
    belongs_to :school
    has_many :user_teams
    has_many :notice_posts
    has_many :posts
    has_many :schedules
    has_many :users, :through => :user_teams
    
    validates :name, presence: true
    validates :intro_text, presence: true
end
