ENV["RACK_ENV"] ||= "development"

require_relative './models/link.rb'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base
  get '/' do
    erb(:home)
  end

  post '/' do
    @user = User.create(address: params[:email], password: params[:pw])
    p @user
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:'/links/index')
  end

  get '/links/new' do
     erb(:'/links/new')
  end

  post '/links' do
    input = params[:tag].split(" ")
    tag_list = []
    input.each {|tag| tag_list << Tag.create(name: tag)}
    link = Link.create(url: params[:url], title: params[:title])
    tag_list.each {|tag| link.tags << tag}
    link.save
    redirect ('/links')
  end

  post '/tags' do
    @tags = params[:tags] ||= ''
    @links = Link.all.select { |link| link.tags.first.name == @tags }
    erb(:'/links/index')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
