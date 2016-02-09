class Link
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :url, Text
end

DataMapper.setup(:default, 'postgres://localhost/bookmarkmanager')
DataMapper.finalize.auto_upgrade!