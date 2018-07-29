class CreateCustomerPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_preferences do |t|
      t.int4range :age
      t.integer :species, array: true, default: [], null: false
      t.integer :breed, array: true, default: [], null: false

      t.timestamps
    end
  end
end
