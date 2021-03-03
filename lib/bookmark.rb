require 'pg'

class Bookmark

    def self.all
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bookmark_manager_test')
      else
        connection = PG.connect(dbname: 'bookmark_manager')
      end

      result = connection.exec("SELECT * FROM bookmarks;")
      result.map { |bookmark| "#{bookmark['title']}: #{bookmark['url']}"}
    end

    def self.create(title:, url:)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bookmark_manager_test')
      else
        connection = PG.connect(dbname: 'bookmark_manager')
      end
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title")
    end

end
