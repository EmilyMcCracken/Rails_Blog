class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@user = current_user
		@comment.user_id = @user.id
		@comment.post_id = params[:comment][:post_id]
    	@comment.save 
  		redirect_to post_path
	end

	private

	def comment_params
		params.require(:comment).permit(:title, :body)   
  	end
end
