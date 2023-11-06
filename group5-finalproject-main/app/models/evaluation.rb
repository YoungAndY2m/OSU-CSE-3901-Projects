class Evaluation < ApplicationRecord
    belongs_to :student, optional: true
    belongs_to :team, optional: true
end
