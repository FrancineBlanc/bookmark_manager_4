feature "Viewing Bookmarks" do
  scenario "seeing a list of bookmarks" do
    connection = PG.connect dbname: "bookmark_manager_test"

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.bbc.co.uk', 'BBC');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'https://www.w3schools.com', 'w3schools');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.freecodecamp.org', 'freecodecamp');")

    visit "/bookmarks/show"

    expect(page).to have_content "BBC"
    expect(page).to have_content "w3schools"
    expect(page).to have_content "freecodecamp"
  end

end