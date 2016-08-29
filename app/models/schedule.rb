class Schedule < ActiveRecord::Base
    belongs_to :team
    has_many   :attendances
    
    validates :position, presence: true
    validates :name, presence: true
    validates :date, presence: true
    validates :time, presence: true
end
