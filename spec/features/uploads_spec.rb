require 'rails_helper'

feature "Uploads", :type => :feature do
  scenario "Uploading pictures" do 
  	visit root_path
  	click_link 'Upload'
  	fill_in "Title", with: "My Photo"
  	fill_in "Description", with: "Holidays"
    attach_file('picture_file', File.join(Rails.root, 'spec', 'fixtures', 'picture.jpeg'))
  	click_button "Save"

  	expect(page).to have_content 'Holidays'
  	expect(page).to have_content 'My Photo'
  	expect(page).to have_content 'Picture was successfully created.'

  end
end
