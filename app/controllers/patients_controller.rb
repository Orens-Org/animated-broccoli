class PatientsController < ApplicationController
  def index
    @adult_ordered_patients = Patient.adults_alpha_ordered
  end
end