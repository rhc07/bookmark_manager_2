feature 'adding bookmark to list' do
  scenario 'user can add bookmark' do
    visit '/bookmarks'
    click_button('Add')
    fill_in('url', with: 'www.yahoo.com')
    click_button('Submit')
    expect(page).to have_content 'www.yahoo.com'
  end
end