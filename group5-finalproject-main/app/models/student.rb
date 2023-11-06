class Student < ApplicationRecord
    has_secure_password validations: false
    has_many :studentsTeam, :dependent => :destroy
    has_many :teams, through: :studentsTeam
    has_many :evaluations, :dependent => :destroy
    accepts_nested_attributes_for :teams, allow_destroy: true, reject_if: :all_blank

    validates_presence_of :last_name
    validates_presence_of :first_name
    validates_presence_of :username

    
    def nice_display
        "#{first_name} #{last_name}, #{username}"
    end
end
