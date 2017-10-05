source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml-rails', '~> 1.0'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'greensock-rails', '~> 1.20', '>= 1.20.2.0'
gem 'autoprefixer-rails', '~> 7.1', '>= 7.1.4.1'

source 'https://rails-assets.org' do
  gem 'rails-assets-normalize.css'
  gem 'rails-assets-ScrollMagic'
  gem 'rails-assets-typed.js'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry-rails', '~> 0.3.6'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'puma', '~> 3.7'
  gem 'meta_request', '~> 0.4.3'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '~> 0.21.0'
end
