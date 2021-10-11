require "bookmark"

describe Bookmark do
  it "shows a list of bookmarks" do
    bookmarks = Bookmark.show_bookmarks
    expect(bookmarks).to include "http://www.bbc.co.uk"
    expect(bookmarks).to include "https://www.w3schools.com"
    expect(bookmarks).to include "https://www.freecodecamp.org"
  end
end