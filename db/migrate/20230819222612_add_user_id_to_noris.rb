class AddUserIdToNoris < ActiveRecord::Migration[7.0]
  def change
    add_column :noris, :user_id, :integer
  end
end
