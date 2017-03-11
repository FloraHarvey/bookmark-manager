require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

ENV["RACK_ENV"] ||= 'development'

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session['user_id'])
    end
  end

  get '/' do
    'Hello World'
    erb :home
  end

  get '/users/new' do
    erb :'links/sign_up'
  end

  post '/sign-up' do
    user = User.create(email: params[:email])
    password = params[:password]
    user.update(password: password)
    user.save
    session['user_id'] = user.id
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
