require "pg"

class Bookmark
  @@connection

  def self.show_bookmarks
    self.establish_connection
    rs = connection.exec("SELECT * FROM bookmarks;")
    rs.map do |row| 
      {url: row["url"],
      title: row["title"]}
    end
  end

  def self.create(url:, title:)
    self.establish_connection
    connection.exec("INSERT INTO bookmarks(url, title) VALUES ('#{url}', '#{title}');")
  end

  private

  def self.connection
    @@connection
  end

  def self.establish_connection
    if ENV['ENVIRONMENT'] == 'test'
      @@connection = PG.connect dbname: "bookmark_manager_test"
    else
      @@connection = PG.connect dbname: "bookmark_manager"
    end
  end
end