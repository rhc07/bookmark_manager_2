require 'bookmark'
require 'pg'

describe Bookmark do
  describe '#.all' do
    it 'views all saved bookmarks' do

      bookmark = Bookmark.create(title: 'Makers', url: 'http://www.makersacademy.com')
      Bookmark.create(title: 'Google', url: 'http://www.google.com')
      Bookmark.create(title: 'Destroy All Software', url: 'http://www.destroyallsoftware.com')

      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#.create' do
    it 'should add a bookmark to the database' do
      bookmark = Bookmark.create(title: 'Yahoo', url: 'www.yahoo.com')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id= #{bookmark.id};")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.url).to eq 'www.yahoo.com'
      expect(bookmark.title).to eq 'Yahoo'
    end
  end
end
