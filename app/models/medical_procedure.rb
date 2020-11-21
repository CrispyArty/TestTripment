# frozen_string_literal: true

class MedicalProcedure < ApplicationRecord
  scope :filtered, ->(q) { where('name ILIKE ?', "%#{q}%") }
  scope :sorted, ->(q) { order(Arel.sql("name ILIKE '#{sanitize_sql_like(q)}%' desc, name")) }
end
