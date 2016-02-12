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

  get '/tags/bubbles' do
    
    @filtered_links = []
    @links = Link.all
    
    @links.each do |link|
      link.tags.each do |tag|
        @filtered_links << link if tag.name == 'bubbles'
      end
    end
    
    erb :tags_bubbles
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
