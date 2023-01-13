class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    @adult_ordered_patients = Patient.adults_alpha_ordered
  end
end