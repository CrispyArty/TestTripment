# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MedicalProcedure, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'filtered and sorted query' do
    before do
      FactoryBot.create :medical_procedure, name: 'Angiography'
      FactoryBot.create :medical_procedure, name: 'Hand surgery'
      FactoryBot.create :medical_procedure, name: 'Cerebral angiography'
      FactoryBot.create :medical_procedure, name: 'Angiography 2'
    end

    it 'respects the right order' do
      query = MedicalProcedure.filtered('An').sorted('An').map(&:name)
      expect(query).to eq([
                            'Angiography',
                            'Angiography 2',
                            'Cerebral angiography',
                            'Hand surgery'
                          ])
    end
  end
end
