# frozen_string_literal: true

require 'httparty'

class AddMovieService

  include HTTParty
  base_uri 'https://www.omdbapi.com/?'

  def initialize
    @omdb_api_key = { query: { apikey: Rails.application.credentials.omdbapi[:key] } }
  end

  def get_by_title(title:)
    response = JSON.parse(self.class.get("t=#{title}", omdb_api_key).body)
    create_movie(response: response)
  end

  def get_by_title_and_year(title:, year:)
    response = JSON.parse(self.class.get("t=#{title}&y=#{year}", omdb_api_key).body)
    create_movie(response: response)
  end

  def get_by_id(id:)
    response = JSON.parse(self.class.get("i=#{id}", omdb_api_key).body)
    create_movie(response: response)
  end

  def create_movie(response:)
    Movie.create!(title: response['Title']) if response['Response'] == 'True'
  end

  private

  attr_reader :omdb_api_key


end
