feature "Test Page" do
  scenario "Testing infrastructure" do
    visit "/"
    expect(page).to have_content "Welcome to the Bookmark Manager"
  end
end