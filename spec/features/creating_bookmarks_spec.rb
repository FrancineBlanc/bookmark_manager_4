feature "Add new bookmark" do
  scenario "adding new bookmark" do
    visit "/bookmarks/show"
    click_button "Create new bookmark"

    youtube_url = "http://www.youtube.com"
    fill_in :url, with: youtube_url
    click_button "Add"

    expect(page).to have_content youtube_url
  end
end