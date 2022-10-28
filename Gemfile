source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

gem 'bootsnap', '>= 1.1.0', require: false
gem 'faker'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2'
gem 'simple_form'
gem 'uglifier', '>= 1.3.0'
gem 'validate_url'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sqlite3', '~> 1.3.6'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "shakapacker", "~> 6.5"
