class Coordinator < ApplicationRecord
    has_and_belongs_to_many :registries
    has_many :enrollments
    has_many :participants, through: :enrollments

    validates :email, uniqueness: true
    validates :email, :name, :phone_number, presence: true 
end
