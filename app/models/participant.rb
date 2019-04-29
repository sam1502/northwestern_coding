class Participant < ApplicationRecord
    has_many :enrollments
    has_many :registries
    
    validates :name, uniqueness: true
    validates :name, :gender, :date_of_birth, presence: true
end
