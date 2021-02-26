require 'sinatra/base'
require './lib/bookmark'

class Bookmark_Manager < Sinatra::Base

    get '/' do
        erb :index
    end

    get '/bookmarks' do
        @bookmarks = Bookmark.all
        erb :bookmarks
    end

    get '/new' do
        erb :new
    end

    post '/new' do
        Bookmark.create(params[:title], params[:url])
        redirect '/bookmarks'
    end

run! if app_file == $0

end
