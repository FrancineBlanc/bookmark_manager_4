feature "Viewing Bookmarks" do
  scenario "seeing a list of bookmarks" do
    connection = PG.connect dbname: "bookmark_manager_test"

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.bbc.co.uk');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'https://www.w3schools.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.freecodecamp.org');")

    visit "/bookmarks/show"

    expect(page).to have_content "http://www.bbc.co.uk"
    expect(page).to have_content "https://www.w3schools.com"
    expect(page).to have_content "https://www.freecodecamp.org"
  end

  scenario "adding new bookmark" do
    visit "/bookmarks/show"
    click_button "Create new bookmark"

    youtube_url = "http://www.youtube.com"
    fill_in :url, with: youtube_url
    click_button "Add"

    expect(page).to have_content youtube_url
  end
end