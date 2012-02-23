class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.twitter_oauth_token = auth["credentials"]["token"]
      user.twitter_oauth_token_secret = auth["credentials"]["secret"]
    end
  end

  def add_angellist_from_omniauth(auth)
    self.angellist_name = auth["info"]["name"]
    self.angellist_oauth_token = auth["credentials"]["token"]
    self.angellist_oauth_token_secret = auth["credentials"]["secret"]
    save!
  end

	def fetch_n_publish

			Twitter.configure do |config|
				config.oauth_token = self.twitter_oauth_token
				config.oauth_token_secret = self.twitter_oauth_token_secret
			end
			
			tweet = Twitter.search("from:#{self.name} #ag", :since_id => self.last_tweet_id, :rpp => 1, :result_type => 'recent').first

			client = AngellistApi::Client.new(:access_token => self.angellist_oauth_token)
			
			client.post_status_updates(:startup_id => self.startup_id, :message => tweet.text)
		
			if (!tweet.nil?)
				self.last_tweet_id = tweet.id
				self.save
			end
			
			return tweet

	end

end
