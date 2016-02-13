ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    @links = Link.all
    erb(:index)
  end

  get '/new' do
    erb(:new)
  end

  post '/' do
    tag_delimiter = /,\s*/
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split(tag_delimiter).each do |tag|
      link.tags << Tag.first_or_create(category: tag)
    end
    link.save
    redirect('/')
  end

  get '/tags/:tag' do
    tag = Tag.first(category: params[:tag])
    @links = tag ? tag.links : []
    erb(:index)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
