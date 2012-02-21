class TweetsController < ApplicationController
  def fetch_n_publish
		
		return_value = current_user.fetch_n_publish

		if (return_value[:status] == false)
			render :text => return_value[:message]
		else	
			@tweets = return_value[:tweets]
			render 'fetch_n_publish'
		end

  end


	def get_startup
		@startup = current_user
		render 'get_startup'
	end

	def set_startup
		domain = params[:user][:startup_domain]
		current_user.startup_domain = domain
		current_user.startup_id = AngellistApi.startup_search(:domain => domain)[:id]
		current_user.save
		redirect_to root_path, :notice => "Yo !! you got a startup id"
	end

end
