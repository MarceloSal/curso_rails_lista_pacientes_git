class AddCategoryToPatientlists < ActiveRecord::Migration[5.2]
  def change
    add_reference :patientlists, :category, foreign_key: true
  end
end
