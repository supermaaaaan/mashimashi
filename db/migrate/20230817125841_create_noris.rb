class CreateNoris < ActiveRecord::Migration[7.0]
  def change
    create_table :noris do |t|
      t.string :address
      t.string :shop_name
      t.integer :price
      t.string :name
      t.text :about

      t.timestamps
    end
  end
end
