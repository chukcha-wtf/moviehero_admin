# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'moveiheroes_admin'
set :repo_url, 'git@github.com:chukcha-wtf/moviehero_admin.git'

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

after "deploy:restart", "puma:restart"

set :deploy_to, '/home/movieheroes/www'