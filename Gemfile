source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'sqlite3', '~> 1.3', '>= 1.3.13'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'haml-rails', '~> 1.0'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'greensock-rails', '~> 1.20', '>= 1.20.2.0'
gem 'autoprefixer-rails', '~> 7.1', '>= 7.1.4.1'
gem 'neat', '~> 2.1'
gem 'inline_svg', '~> 1.2', '>= 1.2.3'
gem 'friendly_id', '~> 5.2', '>= 5.2.3'
gem 'active_link_to', '~> 1.0', '>= 1.0.5'
gem 'clearance', '~> 1.16', '>= 1.16.1'
gem 'paperclip', '~> 5.2', '>= 5.2.1'
gem 'cocoon', '~> 1.2', '>= 1.2.11'
gem 'order_as_specified', '~> 1.3'
gem 'babosa', '~> 1.0', '>= 1.0.2'
gem 'newrelic_rpm', '~> 4.5', '>= 4.5.0.337'
gem 'acts_as_list', '~> 0.9.10'
gem 'meta-tags', '~> 2.7'
gem 'loofah', '~> 2.2', '>= 2.2.1'

source 'https://rails-assets.org' do
  gem 'rails-assets-normalize-css'
  gem 'rails-assets-ScrollMagic'
  gem 'rails-assets-typed.js'
  gem 'rails-assets-mousetrap'
end

group :development, :test do
  gem 'dotenv-rails', '~> 2.2', '>= 2.2.1'
  gem 'pry-rails', '~> 0.3.6'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'puma', '~> 3.7'
  gem 'better_errors', '~> 2.4'
  gem 'binding_of_caller', '~> 0.7.3'
  gem 'annotate', '~> 2.7', '>= 2.7.2'
  gem 'meta_request', '~> 0.4.3'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', '~> 3.10'
  gem 'capistrano-bundler', '~> 1.3'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rails', '~> 1.3'
  gem 'capistrano-rvm', '~> 0.1.2'
end
