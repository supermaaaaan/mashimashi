class AddImageToNoris < ActiveRecord::Migration[7.0]
  def change
    add_column :noris, :image, :string
    add_column :noris, :hoshi, :integer
  end
end
