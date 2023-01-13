require 'rails_helper'

RSpec.describe 'The Doctor Show Page', type: :feature do
  let!(:hospital1) { Hospital.create!(name: "General Hospital") }
  let!(:hospital2) { Hospital.create!(name: "Red Cross") }

  let!(:doctor1) { Doctor.create!(name: "Dr. Oregano", specialty: "Brain Surgery", university: "U of M", hospital: hospital1 ) }  
  let!(:doctor2) { Doctor.create!(name: "Dr. Franken", specialty: "Ear Surgery", university: "U of L", hospital: hospital1 ) }  
  let!(:doctor3) { Doctor.create!(name: "Dr. Stein", specialty: "Neck Surgery", university: "U of A", hospital: hospital1 ) }  
  let!(:doctor4) { Doctor.create!(name: "Dr. Dre", specialty: "Beat Surgery", university: "U of P", hospital: hospital1 ) }  

  let!(:patient1) { Patient.create!(name: "Elizabeth", age: 37) }
  let!(:patient2) { Patient.create!(name: "Tony", age: 12) }
  let!(:patient3) { Patient.create!(name: "Ben", age: 23) }
  let!(:patient4) { Patient.create!(name: "Paul", age: 93) }
  let!(:patient5) { Patient.create!(name: "Sarah", age: 58) }
  let!(:patient6) { Patient.create!(name: "Charizard", age: 187) }

  let!(:doctor_patient1) { DoctorPatient.create!(doctor: doctor1, patient: patient1) }
  let!(:doctor_patient2) { DoctorPatient.create!(doctor: doctor1, patient: patient2) }
  let!(:doctor_patient3) { DoctorPatient.create!(doctor: doctor1, patient: patient3) }
  let!(:doctor_patient4) { DoctorPatient.create!(doctor: doctor1, patient: patient4) }

  let!(:doctor_patient5) { DoctorPatient.create!(doctor: doctor2, patient: patient1) }
  let!(:doctor_patient6) { DoctorPatient.create!(doctor: doctor2, patient: patient2) }
  let!(:doctor_patient7) { DoctorPatient.create!(doctor: doctor3, patient: patient6) }

  let!(:doctor_patient8) { DoctorPatient.create!(doctor: doctor4, patient: patient4) }
  let!(:doctor_patient9) { DoctorPatient.create!(doctor: doctor4, patient: patient5) }
  let!(:doctor_patient10) { DoctorPatient.create!(doctor: doctor4, patient: patient6) }
  describe 'when I visit the show page' do
    it 'shows all of that doctors information' do
      visit doctor_path(doctor1)
      
      expect(page).to have_content(doctor1.name)
      expect(page).to have_content(doctor1.specialty)
      expect(page).to have_content(doctor1.university)

      expect(page).to_not have_content(doctor2.name)
      expect(page).to_not have_content(doctor3.name)
      expect(page).to_not have_content(doctor3.name)
    end

    xit 'shows the name of hospital where they work' do
      visit doctor_path(doctor1)
      
      expect(page).to have_content(hospital1.name)
      expect(page).to_not have_content(hospital2.name)
    end

    xit 'shows the names of all their patients' do
      visit doctor_path(doctor1)
      
      expect(page).to have_content(patient1.name)
      expect(page).to have_content(patient2.name)
      expect(page).to have_content(patient3.name)
      expect(page).to have_content(patient4.name)

      expect(page).to_not have_content(patient5.name)
      expect(page).to_not have_content(patient6.name)
    end
  end
end