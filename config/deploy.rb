require "bundler/capistrano"

set :application, "newaperio"
set :repository,  "git@github.com:newaperio/site.git"
set :branch, "master"
set :deploy_via, :remote_cache

set :scm, :git
set :scm_username, "newaperio"

role :web, "newaperio.com"                          # Your HTTP server, Apache/etc
role :app, "newaperio.com"                          # This may be the same as your `Web` server
role :db,  "newaperio.com", :primary => true # This is where Rails migrations will run
set :deploy_to, "/var/railsapps/newaperio"
set :use_sudo, false
set :user, 'capistrano'

set :config_files, %w( database.yml )

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
		run "chmod -R 777 #{release_path}/public/"
  end
end