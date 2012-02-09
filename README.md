# hashAG

A rails based application to publish tweets with hashtag #ag on user's startup profile at angellist (angel.co)

<a href="http://blooming-frost-6120.herokuapp.com">See the Live Demo here.</a>

## Documentation

hashAG requires the user to authenticate from his twitter first. The user then needs to authenticate using his angellist account. The publishing to angellist part is not automated yet. There is a button that comes up to check & publish the tweet with hashtag #ag to angellist account.

### Getting Started

Although the app can be deployed on any rails server, below are the steps to get it running on heroku

1. Clone the code on your PC. Run bundle install to get heroku gem installed.
2. Get yourself an account at http://heroku.com . Come back to your rails code base directory. Do 'heroku login' & pass your details. Follow http://devcenter.heroku.com/articles/git & it would create your own app with an awesome name (mine is blooming-frost-6120).
3. The app authenticates via twitter & angellist. You need to create your apps at http://dev.twitter.com/apps & http://angel.co/api -> Your Apps . The 'callback url' is important. This is the url to which twitter/angellist sends you oauth token back. My callback url is http://blooming-frost-6120.herokuapp.com/auth/twitter/callback for twitter &  http://blooming-frost-6120.herokuapp.com/auth/angellist/callback for angellist. You need to specify yours according to your url.
4. Come back to your rails app home directory. Add keys & secret of your twitter & angellist apps as    
			
		heroku config:add RAILS_ENV=development TWITTER_KEY=xxx TWITTER_SECRET=xxx ANGELLIST_KEY=xxx ANGELLIST_SECRET=xxx

	These values will be used in config/initializers/omniauth.rb .

5. Do 'git push heroku' for the app to be deployed & launch on heroku.

### Using the app

1. You need to have a twitter & angellist (angel.co) account to be able to use the app. Register at both places. Create a temp startup in your angellist account.

2. Go to http://blooming-frost-6120.herokuapp.com/ , authenticate with your twitter & then angellist. Get your startup id from your domain (mine is stalkninja.com).

3. Now go to twitter & tweet from your account with '#ag' in it. Come back to the app, hit on 'Check & publish my tweets to angellist'. The app would fetch the tweets &  would publish it on your startup profile. 

P.S. - it seems getting an angellist account & creating your own startup is a pain. Drop me a mail at pocha(at)stalkninja(dot)com & I would share my credentials with you.

### Changes needed

1. Now, I just wrote the code to check the last tweet of the user with #ag . Fetching again would repeat the tweet. This is wrong. The tweets have an id (something like a timestamp) & you can search the tweet with 'since_id' - http://rubydoc.info/gems/twitter/Twitter/Client/Search . Basically everytime the code checks for tweets, it should record the latest id of the tweet in 'since_id' field in database so that next time, the code would only check from that 'since_id'. The code is in 'app/controller_tweets_controller.rb'
 
2. Once point 1 is done, this fetching & publishing needs to be automated. This can be done using a rake task.

3. We need to give a nice UI for it to be usable by general audience. Bootstrap css framework from twitter would be awesome to use. This is lowest in priority though.
