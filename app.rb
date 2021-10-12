require "sinatra/base"
require "sinatra/reloader"
require_relative "./lib/bookmark"

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/bookmarks/index" do
    erb(:index)
  end

  get "/bookmarks/show" do
    @bookmarks = Bookmark.show_bookmarks
    erb(:bookmarks)
  end

  get "/bookmarks/new" do
    erb(:new_bookmark)
  end

  post "/bookmarks/add" do
    @url = params[:url]
    Bookmark.create(url: @url)
    redirect "/bookmarks/show"
  end

  run! if app_file == $0
end