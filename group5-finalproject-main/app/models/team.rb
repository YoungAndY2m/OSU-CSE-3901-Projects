class Team < ApplicationRecord
    has_many :studentsTeam, :dependent => :destroy
    has_many :students, through: :studentsTeam
    belongs_to :presentation_event, optional: true
    has_many :evaluations, :dependent => :destroy
    accepts_nested_attributes_for :students, allow_destroy: true, reject_if: :all_blank
end
