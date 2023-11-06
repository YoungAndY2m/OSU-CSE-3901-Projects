class PresentationEvent < ApplicationRecord
    has_many :teams
    accepts_nested_attributes_for :teams, allow_destroy: true, reject_if: :all_blank
end
