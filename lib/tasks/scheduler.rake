namespace :publish do
	desc "Publishing tweets of all the registered users"
	task :tweets => :environment do
		User.all.each do |user|
			puts "parsing user #{user.name}"
			if (!user.startup_id.nil?)
				@tweets = user.fetch_n_publish
				puts @tweets.to_yaml
			end
		end
	end
end
