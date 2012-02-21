class AddStartupIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :startup_id, :integer
  end
end
