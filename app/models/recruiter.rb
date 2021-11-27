# frozen_string_literal: true

class Recruiter < ApplicationRecord
  has_many :interviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
