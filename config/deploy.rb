# config valid for current version and patch releases of Capistrano
lock "~> 3.10.0"

set :rvm_ruby_version, '2.4.1'

set :application, "kseniasmirnova"
set :repo_url, "git@bitbucket.org:shtetik/kseniasmirnova.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/kseniasmirnova"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "db/production.sqlite3"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :default_env, {
  'NEW_RELIC_LICENSE_KEY' => ENV["NEW_RELIC_LICENSE_KEY"]
}

after "deploy:updated", "newrelic:notice_deployment"

namespace :deploy do
  desc 'Runs rake db:seed'
  task :seed => [:set_rails_env] do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end
end

namespace :rails do
  rvm_execer = '/usr/local/rvm/bin/rvm default do bundle exec'

  desc 'Open the rails console on the primary remote server'
  task :console do
    on roles(:app), primary: true do |host|
      command = "cd #{deploy_to}/current && #{rvm_execer} rails console #{fetch(:stage)}"
      exec "ssh -l #{host.user} #{host.hostname} -p #{host.port || 22} -t 'cd #{deploy_to}/current && #{command}'"
    end
  end
end
