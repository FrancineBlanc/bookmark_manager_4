require "bookmark"

describe Bookmark do
  describe "#show_bookmarks" do
    it "shows a list of bookmarks" do
      connection = PG.connect dbname: 'bookmark_manager_test'

      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.bbc.co.uk', 'BBC')")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('https://www.w3schools.com', 'w3schools')")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('https://www.freecodecamp.org', 'freecodecamp')")


      bookmarks = Bookmark.show_bookmarks
      urls = bookmarks.map { |row| row[:url] }
      expect(urls).to include "http://www.bbc.co.uk"
      expect(urls).to include "https://www.w3schools.com"
      expect(urls).to include "https://www.freecodecamp.org"
    end
  end
end