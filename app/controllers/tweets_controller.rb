class TweetsController < ApplicationController
  def fetch_n_publish
		@tweets = Twitter.search("from: #{current_user.name} #ag", :rpp => 1, :result_type => 'recent')

		client = AngellistApi::Client.new(:access_token => current_user.angellist_oauth_token_secret)
		
		@tweets.each do |t|
			client.post_status_update(:startup_id => current_user.startup_id, :message => t.text)
		end

		render 'fetch_n_publish'

  end


	def get_startup
		@startup = current_user
		render 'get_startup'
	end

	def set_startup
		domain = params[:startup][:domain]
		current_user.startup_domain = domain
		current_user.startup_id = AngellistApi.startup_search(:domain => domain)[:id]
		current_user.save
		redirect_to root_path, :notice => "Yo !! you got a startup id"
	end

end
