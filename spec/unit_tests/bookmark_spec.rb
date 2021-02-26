require 'bookmark'

describe Bookmark do
  describe '#.all' do
    it 'views all saved bookmarks' do

      Bookmark.create(title: 'Makers', url: 'http://www.makersacademy.com')
      Bookmark.create(title: 'Google', url: 'http://www.google.com')
      Bookmark.create(title: 'Destroy All Software', url: 'http://www.destroyallsoftware.com')

      bookmarks = Bookmark.all
      expect(bookmarks).to include("Makers: http://www.makersacademy.com")
      expect(bookmarks).to include("Google: http://www.google.com")
      expect(bookmarks).to include("Destroy All Software: http://www.destroyallsoftware.com")
    end
  end

  describe '#.create' do
    it 'should add a bookmark to the database' do
      Bookmark.create(title: 'Yahoo', url: 'www.yahoo.com')
      expect(Bookmark.all).to include('Yahoo: www.yahoo.com')
    end
  end
end
