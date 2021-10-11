require "pg"

class Bookmark
  def self.show_bookmarks
    connection = PG.connect dbname: "bookmark_manager"
    rs = connection.exec "SELECT * FROM bookmarks"
    rs.map { |row| row["url"]}
  end
end