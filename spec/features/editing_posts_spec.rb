require 'rails_helper'

RSpec.feature "EditingPosts", type: :feature do
	before do 
		@post = FactoryGirl.create(:post)
		@post.update_attributes(:title => "Edited title", :description => "Edited description" )
	end

	it "successfully edited an existing post" do 
		visit "posts/#{@post.id}/edit"
		fill_in "post[title]", :with => "Edited title"
		fill_in "post[description]", :with => "Edited description"
		click_button "Update Post"
		expect(page).to have_content("Successfully updated post", "Edited title", "Edited description")
	end 

	it "failed to edit an existing post" do 
	end 
end
