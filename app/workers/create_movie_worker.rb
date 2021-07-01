# frozen_string_literal: true

# require_relative '../lib/populator_fix.rb'
class CreateMovieWorker

  include Sidekiq::Worker
  sidekiq_options queue: 'movies', retry: false

  def perform(title:)
    api.get_by_title(title: title)
  end

  def api
    @api ||= AddMovieService.new
  end

end
