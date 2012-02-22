class AddAngellistNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :angellist_name, :string
  end
end
