require 'bookmark'

describe Bookmark do
  describe '#.all' do
    it 'views all saved bookmarks' do

      Bookmark.create(url: 'http://www.makersacademy.com')
      Bookmark.create(url: 'http://www.google.com')
      Bookmark.create(url: 'http://www.destroyallsoftware.com')

      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
    end
  end

  describe '#.create' do
    it 'should add a bookmark to the database' do
      Bookmark.create(url: 'www.yahoo.com')
      expect(Bookmark.all).to include('www.yahoo.com')
    end
  end
end
