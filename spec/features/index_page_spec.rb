feature 'displays my bookmarks' do
    scenario 'clicks through to see all bookmarks' do
        visit('/')
        expect(page).to have_link( href: '/bookmarks')
    end
end
