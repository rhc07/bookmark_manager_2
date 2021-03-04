feature 'adding bookmark to list' do
  scenario 'user can add bookmark' do
    visit '/bookmarks'
    fill_in :title, with: 'Yahoo'
    fill_in :url, with: 'www.yahoo.com'
    click_button('Submit')
    expect(page).to have_link("Yahoo", href: "www.yahoo.com")
  end
end
