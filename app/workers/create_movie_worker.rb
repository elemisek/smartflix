# frozen_string_literal: true

# require_relative '../lib/populator_fix.rb'
class CreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'movies', retry: false

  def perform(* _args)
    Movie.create!(title: Faker::Movie.title)
  end
end
