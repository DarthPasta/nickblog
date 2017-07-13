require 'rails_helper'

RSpec.feature "AddingNewPosts", type: :feature do
	it "successfully added new post" do 
		visit root_path
		page.should have_content("Welcome to Nick's Blog")
		click_link('New post')
		expect(page).to have_content("New Post Page")
		fill_in "post[title]", :with => "Test Title"
		fill_in "post[description]", :with => "Test Description"
		click_button "Add Post"
		expect(page).to have_content("Successfully created post", "Test Title", "Test Description")
	end
end
