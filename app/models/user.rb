class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.twitter_oauth_token = auth["credentials"]["token"]
      user.twitter_oauth_token_secret = auth["credentials"]["secret"]
    end
  end

  def add_angellist_from_omniauth(auth)
    self.angellist_oauth_token = auth["credentials"]["token"]
    self.angellist_oauth_token_secret = auth["credentials"]["secret"]
    save!
  end
end
