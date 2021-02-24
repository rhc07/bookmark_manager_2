feature 'viewing bookmarks' do
  scenario 'viewing all saved bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create(url: 'http://www.makersacademy.com')
    Bookmark.create(url: 'http://www.google.com')
    Bookmark.create(url: 'http://www.destroyallsoftware.com')

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
  end
end
