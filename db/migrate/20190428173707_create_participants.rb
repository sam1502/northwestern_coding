class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :gender
      t.date_of_birth :date

      t.timestamps
    end
  end
end
