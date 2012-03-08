set :application, "renren_demo"
set :repository,  "git@github.com:Tassandar/rubychina-study.git"
set :domain, "58.215.184.61"
set :deploy_env, "production"
set :rails_enva, "production"
set :scm, :git
set :branch , "master"
set :deploy_to , "/home/deploy/renren"
set :use_sudo , false

role :web, domain
role :app, domain
role :db,  domain , :primary => true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end

