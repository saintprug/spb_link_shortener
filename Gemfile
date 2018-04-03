source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '1.2.0.rc1'
gem 'hanami-model', '1.2.0.rc1'

gem 'pg'

gem 'slim'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun', platforms: :ruby

  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
