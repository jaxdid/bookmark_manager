class Link
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :url, Text
end

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize.auto_upgrade!