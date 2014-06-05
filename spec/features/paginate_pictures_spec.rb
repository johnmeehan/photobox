require 'rails_helper'

feature "Paginate Pictures", :type => :feature do
  scenario 'Paginate the picture#index page results' do 
  	10.times{ FactoryGirl.create(:picture)}
  	visit root_path
  	expect(page).to have_css(".pagination")
  	#pagination bar shows up when more that 5 pictures exist
  end
end
