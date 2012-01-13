Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :angellist, ENV['ANGELLIST_KEY'], ENV['ANGELLIST_SECRET']
end
