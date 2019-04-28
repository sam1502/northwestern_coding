class CreateRegistries < ActiveRecord::Migration[5.1]
  def change
    create_table :registries do |t|
      t.string :name
      t.string :location
      t.boolean :state

      t.timestamps
    end
  end
end
