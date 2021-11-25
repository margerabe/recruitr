class Candidate < ApplicationRecord
  belongs_to :position

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
