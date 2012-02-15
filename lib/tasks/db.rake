namespace :db do
  desc "Drop, create, migrate, seed, and fake"
  task :super_reset => ["db:drop", "db:create", "db:migrate", "db:seed"]
end