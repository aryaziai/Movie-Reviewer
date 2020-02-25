class Movie < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    # def self.search(search)
    #     if search
    #         movie = Movie.find_by(title: search)
    #         # if movie
    #         #     self.where(movie_id: movie)
    #         # else
    #         #     Movie.all
    #         # end
    #     else
    #         Movie.all
    #     end
    # end
    def self.search(query)
        if query
             @search = query.downcase
             @movies = Movie.all.where("Lower(title) LIKE ?", "%#{@search}%")
        elsif query.empty?
            @movies = Movie.all
        end 
    end
end
