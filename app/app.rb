ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.create(name: params[:tag])
    #LinkTag.create(link: link, tag: tag)
    link.tags << tag
    link.save
    redirect '/'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links= tag ? tag.links : r[]
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
