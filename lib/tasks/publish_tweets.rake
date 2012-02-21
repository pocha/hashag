namespace :publish do
	desc "Publishing tweets of all the registered users"
	task :tweets => :environment do
		User.all.each do |user|
			if (!user.startup_id.nil?)
				user.fetch_n_publish
			end
		end
	end
end
