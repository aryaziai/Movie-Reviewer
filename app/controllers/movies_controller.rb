class MoviesController < ApplicationController
    
    def index
        @movies = Movie.all
    end

    def show
        @movie = Movie.find(params[:id])
        session[:movie_id] = @movie.id
    end

    def search  
        @movies = Movie.search(params[:search])
        render 'movies/index'
    end

    private 
   
    
    def movies_param
        params.require(:movie).permit(:search, :title)
    end
end