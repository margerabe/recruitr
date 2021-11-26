class Candidate < ApplicationRecord
  belongs_to :position
  has_one :interview

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
