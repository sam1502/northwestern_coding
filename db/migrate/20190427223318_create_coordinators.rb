class CreateCoordinators < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinators do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phoneNumber

      t.timestamps
    end
    add_index :coordinators, :email, unique: true
  end
end
