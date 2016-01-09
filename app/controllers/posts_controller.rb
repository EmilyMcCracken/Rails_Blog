class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@posts = Post.find(params[:id])
		@comment = Comment.new
		@user = current_user
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@user = current_user
		@post.user_id = @user.id
    	@post.save 

  		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)   
  	end

end
