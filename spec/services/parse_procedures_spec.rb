# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ParseProcedures do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'parse procedures from Wiki' do
    before do
      obj = double('test html')

      allow(obj).to receive(:open).and_return(
        File.new("#{Rails.root}/spec/fixtures/wiki_medical_procedures.html")
      )

      allow(URI).to receive(:parse).and_return obj
    end

    it 'fill table' do
      expect(ParseProcedures.new.call).to be_eql('Parsed 94 new records')
    end

    it 'insert only new records' do
      FactoryBot.create :medical_procedure, name: 'Angiography'
      FactoryBot.create :medical_procedure, name: 'Ultrasonography'
      expect(ParseProcedures.new.call).to be_eql('Parsed 92 new records')
    end
  end
end
