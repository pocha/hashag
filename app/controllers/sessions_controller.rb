class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    if(auth["provider"] == "twitter")
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to root_path, notice: "Signed in!"
    elsif(auth["provider"] == "angellist" && current_user)
      current_user.add_angellist_from_omniauth(auth)
      redirect_to root_path, notice: "Authenticated with Angellist!"
    end
  end

  def destroy
		if (params[:provider] == 'twitter')
    	current_user.twitter_oauth_token = nil
			current_user.twitter_oauth_token_secret = nil
			current_user.save
			session[:user_id] = nil
		end

		if (params[:provider] == 'angellist')
			current_user.angellist_oauth_token = nil
			current_user.angellist_name = nil
			current_user.startup_id = nil
			current_user.startup_domain = nil
			current_user.save
		end
    redirect_to root_path, notice: "Signed out!"
  end
end
