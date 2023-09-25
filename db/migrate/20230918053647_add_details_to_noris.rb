class AddDetailsToNoris < ActiveRecord::Migration[7.0]
  def change
    add_column :noris, :lat, :float
    add_column :noris, :lng, :float
  end
end
