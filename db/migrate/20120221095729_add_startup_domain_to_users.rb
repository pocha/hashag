class AddStartupDomainToUsers < ActiveRecord::Migration
  def change
    add_column :users, :startup_domain, :string
  end
end
