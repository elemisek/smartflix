#require_relative '../lib/populator_fix.rb'
class CreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'movies', retry: false

  def perform(*args)
    Movie.create!(Title: Faker::Movie.title)
    end
  end
