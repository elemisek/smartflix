# frozen_string_literal: true

require 'sidekiq/web'
# or require 'sidekiq/pro/web'
# or require 'sidekiq-ent/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
end
