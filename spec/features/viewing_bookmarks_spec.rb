feature 'viewing bookmarks' do
  scenario 'viewing all saved bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create(title: 'Makers', url: 'www.makersacademy.com')
    Bookmark.create(title: 'Google', url: 'www.google.com')
    Bookmark.create(title: 'Destroy All Software', url: 'www.destroyallsoftware.com')

    visit('/bookmarks')

    expect(page).to have_link("Makers", href: "http://www.makersacademy.com")
    expect(page).to have_link("Google", href: "http://www.google.com")
    expect(page).to have_link("Destroy All Software", href: "http://www.destroyallsoftware.com")
  end
end
