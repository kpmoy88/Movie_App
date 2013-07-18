class MoviesController < ApplicationController
	
	before_action :load_movie, :only => [:edit, :update, :show]

	def index
		@movies = Movie.search_for(params[:query])
	end

	def new
  		@movie = Movie.new
	end

	def edit 
	end

	def update
  		@movie.update movie_params

  		if @movie.save
  			redirect_to @movie
  		else
  			render 'edit'
  		end
  	end

	def create
		@movie = Movie.new(movie_params)

    	if @movie.save
			redirect_to @movie
		else
			render 'new'
		end
	end

	def search
		@movies = Movie.search_for(params[:query])
		render 'search'
	end

	def show
	end

	private

 	def load_movie
  		@movie = Movie.find(params[:id])
 	end

	def movie_params
  		params.require('movie').permit(:title, :description, :year_released, :rating)
	end
end