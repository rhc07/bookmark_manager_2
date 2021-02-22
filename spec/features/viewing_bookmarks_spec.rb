feature 'viewing bookmarks' do
  scenario 'viewing all saved bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
  end
end
