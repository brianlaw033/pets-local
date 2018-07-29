class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.timestamp :available_from
      t.integer :age
      t.integer :species
      t.integer :breed
      t.integer :customer_id

      t.timestamps
    end
  end
end
