feature "Viewing Bookmarks" do
  scenario "seeing a list of bookmarks" do
    connection = PG.connect dbname: "bookmark_manager_test"

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.bbc.co.uk');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'https://www.w3schools.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.freecodecamp.org');")

    visit "/bookmarks"

    expect(page).to have_content "http://www.bbc.co.uk"
    expect(page).to have_content "https://www.w3schools.com"
    expect(page).to have_content "https://www.freecodecamp.org"
  end
end