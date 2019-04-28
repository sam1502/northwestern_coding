class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.string :date_of_enrollment
      t.string :method_of_contact
      t.string :remarks

      t.timestamps
    end
  end
end
