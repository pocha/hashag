source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-angellist', git: 'git://github.com/railsjedi/omniauth-angellist.git'
gem 'twitter'
gem 'angellist_api', git: 'git://github.com/utkarshkukreti/angellist-api.git', branch: 'feature/bump-hashie-to-1.x'
gem 'haml-rails'
gem 'compass', '~> 0.12.alpha.4'
gem 'heroku'

group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails'
end

group :production do
  gem 'unicorn'
  gem 'pg'
end
