ENV['DATABASE_URL'] = 'postgres://rsxehhkyrqagct:JcwqDMpEUz2_VWnY3rNjZ55kRX@ec2-54-83-17-9.compute-1.amazonaws.com:5432/d9bin54phqtct9'

require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  property :id,   Serial
  property :title, String
  property :url,  String

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)

DataMapper.finalize
DataMapper.auto_upgrade!
