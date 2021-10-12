feature "Welcome Page" do
  scenario "Home page" do
    visit "/bookmarks/index"
    expect(page).to have_content "Welcome to the Bookmark Manager"
  end
end