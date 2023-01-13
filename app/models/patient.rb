class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.adults_alpha_ordered
    self.where('age > ?', 18).order(name: :asc)
  end
end
