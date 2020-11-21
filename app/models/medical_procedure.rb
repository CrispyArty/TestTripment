class MedicalProcedure < ApplicationRecord

  scope :filtered, ->(q) { where("name ILIKE ?", "%#{q}%") }
  scope :sorted, ->(q) { order("name ILIKE '#{sanitize_sql_like(q)}%' desc, name") }
end
