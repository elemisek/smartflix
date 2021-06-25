# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
class AddMovieService
  OMDBAPI_KEY = Rails.application.credentials.omdb[:key]
  BASE_URI = 'https://www.omdbapi.com/?'
  def perform(title)
    request_uri = build_uri(title)
    res = Net::HTTP.get_response(request_uri)
    create_if_success(res) if res.is_a?(Net::HTTPSuccess)
  end

  private

  def build_uri(title)
    params = { apikey: OMDBAPI_KEY, t: title }
    uri = URI('https://www.omdbapi.com/?')
    uri.query = URI.encode_www_form(params)
    uri
  end

  def create_if_success(response)
    data = JSON.parse(response.body)
    Movie.create(Title: data['Title']) if data['Response'] == 'True'
  end
end
