feature "Viewing Bookmarks" do
  scenario "seeing a list of bookmarks" do
    visit "/bookmarks"
    expect(page).to have_content "http://www.bbc.co.uk"
    expect(page).to have_content "https://www.w3schools.com/"
    expect(page).to have_content "https://www.freecodecamp.org/"
  end
end