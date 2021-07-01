# frozen_string_literal: true

class MoviesController < ApplicationController

  def show
    found_movie = Movie.find_by_title(params[:title])
    if found_movie
      render json: found_movie
    else
      CreateMovieWorker.perform_async
      render json: { error: 'Provided title was not found, please try again later ;)' }.to_json, status: :not_found
    end
  end

end
