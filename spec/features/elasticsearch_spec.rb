require 'rails_helper'

feature "Elasticsearch", :type => :feature do
	before(:all){ 
		FactoryGirl.create(:picture, title: "Fireworks", description: "Limerick")
		FactoryGirl.create(:picture, title: "Party", description: "Dublin")
		FactoryGirl.create(:picture, title: "Concert", description: "Limerick")
	}

	scenario "search bar present" do 
		visit root_path 
		expect(page).to have_css(".search")
	end

	scenario "Search for pictures with Fireworks content" do
		visit root_path 
		fill_in "query", with: 'Fireworks'
		click_button "Search"
		expect(page).to have_text("Fireworks", count: 1) 
		expect(page).to have_css("#picture", count: 1) 
	end

	scenario "Search for pictures with Party content" do
		visit root_path 
		fill_in "query", with: 'Party'
		click_button "Search"
		expect(page).to have_css("#picture", count: 1) 
	end

	scenario "A Search with multiple results" do
		visit root_path 
		fill_in "query", with: 'Limerick'
		click_button "Search"
		expect(page).to have_css("#picture", count: 2) 
	end

	scenario "Bad search" do
		visit root_path 
		fill_in "query", with: 'spoons'
		click_button "Search"
		expect(page).to have_css('.well', text:"No Pictures!") 
	end
end