require 'sinatra/base'
require_relative 'models/link'

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

  post '/links/new' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

p Link.all.count
