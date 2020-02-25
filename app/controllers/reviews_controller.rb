class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    before_action :authorized, only: [:new, :edit, :delete, :add, :update]

    def index
        @reviews = Review.all
    end

    def add
        @review = Review.new
        @user = User.find(session[:user_id])
    end

    def new
        @user = User.find(session[:user_id])
        @movie = Movie.find(session[:movie_id]) 
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        if @review.valid?
            @review.save
            redirect_to @review
        else
            flash[:errors] = @review.errors.full_messages
            redirect_to new_review_path
        end
    end

    def show 
       @user = @review.user
       @movie = @review.movie
       @comment = Comment.new
       session[:review_id] = @review.id
    end

    def edit
       @user = @review.user
       @movie = @review.movie
    end

    def update
        @user = User.find(session[:user_id])
        @review.assign_attributes(review_params)
        if @review.valid?
            @review.save
            redirect_to @review
          else
            render :edit
            redirect_to edit_review_path
          end
    end

    def destroy
        @review.destroy
        redirect_to reviews_path
    end

    private

    def find_review
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:content, :rating, :movie_id, :user_id, :title)
    end

end
