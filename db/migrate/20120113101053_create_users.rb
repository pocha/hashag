class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :twitter_oauth_token
      t.string :twitter_oauth_token_secret
      t.string :angellist_oauth_token
      t.string :angellist_oauth_token_secret
	  t.integer :startup_id
	  t.string :startup_domain
	  t.integer :last_tweet_id, :null => false, :default => 0

      t.timestamps
    end
  end
end
