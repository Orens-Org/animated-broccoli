require 'rails_helper'
RSpec.describe Patient, type: :model do
  let!(:hospital1) { Hospital.create!(name: "General Hospital") }
  let!(:hospital2) { Hospital.create!(name: "Red Cross") }

  let!(:doctor1) { Doctor.create!(name: "Dr. Oregano", specialty: "Brain Surgery", university: "U of M", hospital: hospital1 ) }  
  let!(:doctor2) { Doctor.create!(name: "Dr. Franken", specialty: "Ear Surgery", university: "U of L", hospital: hospital1 ) }  
  let!(:doctor3) { Doctor.create!(name: "Dr. Stein", specialty: "Neck Surgery", university: "U of A", hospital: hospital1 ) }  
  let!(:doctor4) { Doctor.create!(name: "Dr. Dre", specialty: "Beat Surgery", university: "U of P", hospital: hospital1 ) }  

  let!(:patient3) { Patient.create!(name: "Ben", age: 23) }
  let!(:patient6) { Patient.create!(name: "Charizard", age: 187) }
  let!(:patient1) { Patient.create!(name: "Elizabeth", age: 37) }
  let!(:patient5) { Patient.create!(name: "Sarah", age: 58) }

  let!(:patient2) { Patient.create!(name: "Tony", age: 12) }
  let!(:patient4) { Patient.create!(name: "Paul", age: 3) }
  let!(:patient7) { Patient.create!(name: "Borderline", age: 18) }

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

  describe 'the relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe '.adults_alpha_ordered' do
    it 'returns all adults (over 18) in alphabetical A-Z order' do
      expect(Patient.adults_alpha_ordered).to eq([patient3,patient6,patient1,patient5])
      expect(Patient.adults_alpha_ordered).to_not eq([patient1,patient3,patient1,patient5])
      expect(Patient.adults_alpha_ordered).to_not include([patient2])
      expect(Patient.adults_alpha_ordered).to_not include([patient4])
      expect(Patient.adults_alpha_ordered).to_not include([patient7])
    end
  end
end