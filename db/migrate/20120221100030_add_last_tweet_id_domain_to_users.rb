class AddLastTweetIdDomainToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_tweet_id, :string, :null => false, :default => '0'
  end
end
