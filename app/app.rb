require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

ENV["RACK_ENV"] ||= 'development'

  data_mapper_config

enable :sessions

  helpers do
    def current_user
      User.first(:id => session['id'])
    end

  end

  get '/' do
    'Hello World'
    erb :home
  end

  get '/new-user' do
    erb :'links/sign_up'
  end

  post '/sign-up' do
    @user = User.create(email: params[:email])
    password_hash = BCrypt::Password.create(params[:password])
    @user.update(:password => password_hash)
    @user.save
    session['id'] = @user.id
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag1 = Tag.create(tag_name: params[:tag1])
    tag2 = Tag.create(tag_name: params[:tag2])
    link.tags << tag1
    link.tags << tag2
    link.save
    redirect '/links'
  end

  get '/tags/:tag' do
    @matching_links = Link.all(Link.tags.tag_name => params['tag'])
    erb :'links/tags'
  end

end
