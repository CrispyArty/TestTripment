# frozen_string_literal: true

FactoryBot.define do
  factory :medical_procedure do
    sequence(:name) { |i| "name#{i}" }
    category { 'category' }
  end
end
