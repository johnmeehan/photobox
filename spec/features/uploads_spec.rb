require 'rails_helper'

feature "Uploads", :type => :feature do
  describe "Uploading pictures" do 
  	visit root_path
  	click_link 'New Picture'
  	fill_in "Title", with: "My Photo"
  	fill_in "Description", with: "Holidays"
  	click_button "Save"

  	expect(page).to have_content 'Holidays'
  	expect(page).to have_content 'My Photo'
  	expect(page).to have_content 'Picture was successfully created.'

  end
end
