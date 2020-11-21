class MedicalProcedure < ApplicationRecord
  def self.get_ordered_by_query(query)
    sanitized_query = ActiveRecord::Base::sanitize_sql_like(query)

    MedicalProcedure
        .where("name ILIKE '%#{sanitized_query}%'")
        .order("name ILIKE '#{sanitized_query}%' desc, name")
        .all
  end
end
