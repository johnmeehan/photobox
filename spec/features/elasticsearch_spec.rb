require 'rails_helper'

feature "Elasticsearch", :type => :feature do
	before(:all){ 
		FactoryGirl.create(:picture, title: "Fireworks", description: "Limerick")
		FactoryGirl.create(:picture, title: "Party", description: "Dublin")
		FactoryGirl.create(:picture, title: "Concert", description: "Limerick")
	}

	scenario "search present" do 
		visit root_path 
		expect(page).to have_css(".search")
	end

	scenario "Search for pictures with Fireworks content" do
		visit root_path 
		fill_in "query", with: 'Fireworks'
		expect(page).to have_text("Fireworks", count: 2) 
		expect(page).to have_css("#picture", count: 2) 
		# fill_in
	end

	scenario "Search for pictures with Party content" do
		visit root_path 
		fill_in "query", with: 'Party'
		expect(page).to have_css("#picture", count: 1) 
		# fill_in
	end

	# scenario "Bad Search" do
	# 	#3
	# end
end