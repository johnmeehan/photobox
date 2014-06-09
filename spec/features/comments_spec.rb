require 'rails_helper'

feature "Comments", :type => :feature do
  before(:each) do 
    # @picture = FactoryGirl.create(:picture, :attachment)
    @picture = FactoryGirl.create(:picture, :attachment)
    @picture.comments << FactoryGirl.create(:comment)
    visit picture_path(@picture)
  end

  scenario 'user can view comments on a pictures show page' do
  	expect(page).to have_text(@picture.title)
  	expect(page).to have_text("Comments")
  end
  
  scenario 'post comment', js: true  do
  	fill_in 'comment_content', with: 'hello world'
  	click_button 'Post'
  	expect(page.body).to have_text 'hello world' 
  end
end

