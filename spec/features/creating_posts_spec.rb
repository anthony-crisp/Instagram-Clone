require "rails_helper.rb"

feature "Creating posts" do
  scenario "can create a post" do
    visit "/"
    click_link "New Post"
    attach_file("Image", "spec/files/images/barney.jpg")
    fill_in "Caption", with: "#TeeingOff"
    click_button "Create Post"
    expect(page).to have_content("#TeeingOff")
    expect(page).to have_css("img[src*='barney.jpg']")
  end
  it "needs an image to create a post" do
    visit "/"
    click_link "New Post"
    fill_in "Caption", with: "#NoImage"
    click_button "Create Post"
    expect(page).to have_content("Posts require an image, please select an igame and try again.")
  end
end
