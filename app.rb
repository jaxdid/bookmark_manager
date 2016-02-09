require 'sinatra/base'
require 'rubygems'
require 'data_mapper'
#require_relative 'models/link.rb'

DataMapper.setup(:default, 'postgres://localhost/bookmarkmanager')
DataMapper.finalize.auto_upgrade!

class BookmarkManager < Sinatra::Base
  get '/' do
 
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
