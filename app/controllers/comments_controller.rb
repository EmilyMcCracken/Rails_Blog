class CommentsController < ApplicationController
	def index
		@comment = Comments.all
	end

	def show
		@comment = Comment.find(paramas[:id])
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = session[:user_id]
		@comment.post_id = params[:comment][:post_id]
    	@comment.save 
  		redirect_to posts_path 
	end

	private

	def comment_params
		params.require(:comment).permit(:title, :body)   
  	end
end
