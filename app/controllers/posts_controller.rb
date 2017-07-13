class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create 
		@post = Post.new(post_params)
		if @post.save
			flash[:sucess] = "Successfully created post"
			redirect_to root_path
		else
			flash[:danger] = "Failed to create post"
			render 'new'
		end
	end

private
	def post_params
		params.require(:post).permit(:title, :description)
	end

end
