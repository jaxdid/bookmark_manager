require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
  end

  desc "Non-destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
  end
end