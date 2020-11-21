class CreateMedicalProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_procedures do |t|
      t.string :name
      t.string :category
      t.text :lead

      t.timestamps
    end
  end
end
