feature "Add new bookmark" do
  scenario "adding new bookmark" do
    visit "/bookmarks/show"
    click_button "Create new bookmark"

    youtube_url = "http://www.youtube.com"
    fill_in :url, with: youtube_url
    fill_in :title, with: "YouTube"
    click_button "Add"

    expect(page).to have_content "YouTube"
  end
end