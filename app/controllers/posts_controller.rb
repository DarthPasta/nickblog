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
			redirect_to new_post_path
		end
	end

	def edit 
		@post = Post.find(params[:id])
	end

	def update 
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			flash[:success] = "Successfully updated post"
			redirect_to root_path
		else
			flash[:danger] = "Failed to update the post"
			redirect_to edit_post_path(@post.id)
		end
	end

private
	def post_params
		params.require(:post).permit(:title, :description)
	end

end
