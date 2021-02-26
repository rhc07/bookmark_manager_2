feature 'viewing bookmarks' do
  scenario 'viewing all saved bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create(title: 'Makers', url: 'http://www.makersacademy.com')
    Bookmark.create(title: 'Google', url: 'http://www.google.com')
    Bookmark.create(title: 'Destroy All Software', url: 'http://www.destroyallsoftware.com')

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
  end
end
