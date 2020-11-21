# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProceduresController do
  describe 'GET #index' do
    before do
      FactoryBot.create :medical_procedure, name: 'Angiography'
      FactoryBot.create :medical_procedure, name: 'Hand surgery'
      FactoryBot.create :medical_procedure, name: 'Cerebral angiography'
      FactoryBot.create :medical_procedure, name: 'Angiography 2'
    end

    it 'http status ok' do
      get :index, params: { q: 'An' }

      expect(response).to have_http_status(:success)
    end

    it 'returns proper json' do
      get :index, params: { q: 'An' }
      json_response = JSON.parse(response.body)

      expect(json_response.first.keys).to include('id', 'name', 'category')
    end
  end
end
