namespace :publish do
	desc "Publishing tweets of all the registered users"
	task :tweets => :environment do
		User.all.each do |user|
			user.fetch_n_publish
		end
	end
end
