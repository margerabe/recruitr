# frozen_string_literal: true

class Candidate < ApplicationRecord
  belongs_to :position
  has_one :interview, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
