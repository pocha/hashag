namespace :publish do
	desc "Publishing tweets of all the registered users"
	task :tweets => :environment do
		User.all.each do |user|
			puts "parsing user #{user.name}"
			if (!user.startup_id.nil?)
				begin 
					return_data = user.fetch_n_publish
					puts return_data.to_yaml
				rescue Exception => e
					puts "Error: #{e}"
				end
			end
		end
	end
end
