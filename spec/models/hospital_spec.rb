require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it {should have_many :doctors}
  end
end
