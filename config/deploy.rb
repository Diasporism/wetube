set :application, "wetube"
set :repository,  "git://github.com/Diasporism/wetube.git"

# ssh_options[:username] = 'root'

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
before "deploy:start", "deploy:stop"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :bundle do
    run "cd /u/apps/Speakeasy/current/speakeasy_bouncer; bundle; rake db:migrate"
    run "cd /u/apps/Speakeasy/current/speakeasy_dumbwaiter; bundle"
    #run "cd /u/apps/Speakeasy/current/speakeasy_gumshoe; bundle; rake db:migrate"
    run "cd /u/apps/Speakeasy/current/speakeasy_github; bundle; rake db:migrate"
    run "cd /u/apps/Speakeasy/current/speakeasy_vaudeville; bundle; rake db:migrate"
    run "cd /u/apps/Speakeasy/current/speakeasy_core; bundle; rake db:migrate"
  end

  task :start do
    run "cd /u/apps/Speakeasy/current; sudo god -c services.god -D"
  end

  task :stop do
    run "cd /u/apps/Speakeasy/current; god terminate; killall ruby; killall thin;" rescue ""
  end
  
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end


# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end