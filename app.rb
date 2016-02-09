require 'sinatra/base'
require 'rubygems'
require 'data_mapper'
require_relative 'models/link.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
 
  end

  get '/links' do
    @link = Link.get(5)
    erb(:links)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
