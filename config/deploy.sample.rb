set :deploy_to, "/home/rails"
set :deploy_via, :remote_cache
set :use_sudo, false

set :repo_url, "git@bitbucket.org:khoatv/confiss.git"
set :scm, :git
set :branch, "master"

set :ssh_options, {
  user: 'ubuntu',
  auth_methods: ["password"], # prefer to use "publickey"
  # keys: ["PATH_TO_YOUR_PEM_KEY"]
  password: "YOUR PASSWORD"
}

set :format, :pretty
set :log_level, :debug

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
  #   end
  # end

  after :finishing, 'deploy:cleanup'
end