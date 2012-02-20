class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
		render :text => auth
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
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out!"
  end
end
