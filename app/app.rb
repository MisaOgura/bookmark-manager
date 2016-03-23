ENV["RACK_ENV"] ||= "development"

require_relative './models/link.rb'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base
  get '/' do
    redirect('/links')
  end

  get '/links' do
    @links = Link.all
    erb(:'/links/index')
  end

  get '/links/new' do
     erb(:'/links/new')
  end

  post '/links' do
    tag = Tag.create(name: params[:tag])
    link = Link.create(url: params[:url], title: params[:title])
    link.tags << tag
    link.save
    redirect ('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end