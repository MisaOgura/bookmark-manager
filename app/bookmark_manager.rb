ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
    @links = Link.all
    @count = Link.all.count
    erb(:links)
  end

  get '/links/new' do
    erb(:links_new)
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tags/news' do
    p @links_news = Link.all.select { |link| link.tags.first.name == 'news' }
    erb(:tags_news)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

p Link.all.count
