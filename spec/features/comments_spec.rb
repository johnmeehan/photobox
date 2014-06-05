require 'rails_helper'

feature "Comments", :type => :feature do
  scenario 'user can view comments on a pictures show page' do
  	@picture = FactoryGirl.create(:picture, :attachment)
  	visit picture_path(@picture)
  	expect(page).to have_text(@picture.title)
  	expect(page).to have_text("Comments")
  end

  scenario 'post comment' do
  	@picture = FactoryGirl.create(:picture, :attachment)
  	visit picture_path(@picture)
  	fill_in 'comment', with: 'hello world'
  	click_button 'Post'
  	expect(page).to have_text 'hello world' 
  end
end
