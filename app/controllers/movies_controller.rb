class MoviesController < ApplicationController
  def index
    @movies = 
      if params[:q].present?
        ## PG SEARCH IMPLEMENTATION
        movies = Movie.search(params[:q])

        ## Multiple filters
        # movies = movies.near(params[:location]) if params[:location]
        # movies = movies.where('year > ?', params[:min_year]) if params[:min_year]
        # movies = movies.where('year < ?', params[:max_year]) if params[:max_year]

        ## SQL IMPLEMENTATION

        # sql_query = <<~SQL
        # title @@ :q OR
        # synopsis @@ :q OR
        # directors.first_name @@ :q OR
        # directors.last_name @@ :q
        # SQL

        # Movie.joins(:director).where(sql_query, q: "%#{params[:q]}%")
      else
        Movie.all
      end
  end
end
