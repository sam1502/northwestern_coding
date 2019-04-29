class Registry < ApplicationRecord
    has_and_belongs_to_many :coordinators, -> { distinct }
    has_many :enrollments
    has_many :participants, through: :enrollments
    
    validates :name, uniqueness: true
    validates :name, :location, :open, presence: true 
end
