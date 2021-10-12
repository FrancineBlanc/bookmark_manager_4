require "bookmark"

describe Bookmark do
  describe "#show_bookmarks" do
    it "shows a list of bookmarks" do
      connection = PG.connect dbname: 'bookmark_manager_test'

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.bbc.co.uk')")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.w3schools.com')")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.freecodecamp.org')")


      bookmarks = Bookmark.show_bookmarks
      
      expect(bookmarks).to include "http://www.bbc.co.uk"
      expect(bookmarks).to include "https://www.w3schools.com"
      expect(bookmarks).to include "https://www.freecodecamp.org"
    end
  end
end