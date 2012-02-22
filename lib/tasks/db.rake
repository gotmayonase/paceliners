namespace :db do
  desc "Drop, create, migrate, seed, and fake"
  task :super_reset => ["db:drop", "db:create", "db:migrate", "db:seed"]
  
  desc 'Create all the taglines'
  task :taglines => :environment do
    Tagline.destroy_all
    ['car back!', 'for your mobile spin class needs', 'on your left', 'get in line', 'pedal mashers unite!', "because you can't draft alone"].each do |title|
      Tagline.create(:title => title)
    end
  end
end