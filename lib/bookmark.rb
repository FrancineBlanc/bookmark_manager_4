require "pg"

class Bookmark
  def self.show_bookmarks
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: "bookmark_manager_test"
    else
      connection = PG.connect dbname: "bookmark_manager"
    end
    
    rs = connection.exec "SELECT * FROM bookmarks;"
    rs.map { |row| row["url"] }
  end
end