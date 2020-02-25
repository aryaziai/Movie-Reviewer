class CommentsController < ApplicationController
    def new
        @user = User.find(session[:user_id])
        @review = Review.find(session[:review_id]) 
        @comment = Comment.new
    end
    
    def create
        @user = User.find(session[:user_id])
        @review = Review.find(session[:review_id]) 
        @comment = Comment.new(comment_params)
        if @comment.valid?
            @comment.save
            redirect_to review_path(@comment.review)
        else
            flash[:errors] = @comment.errors.full_messages
            redirect_to review_path(@comment.review)
        end 
    end
    
    private

    def comment_params
        params.require(:comment).permit(:content, :title, :user_id, :review_id)
    end

end
