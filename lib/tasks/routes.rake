# frozen_string_literal: true

# This filters out routes for active_storage, action_mailer, etc. that junk
# up the output and ruin the formatting.
# source: https://github.com/ctran/annotate_models/issues/842
task routes: :environment do
  Rails.application.eager_load!
  models = ApplicationRecord.descendants.map(&:name).join("|").downcase
  controllers = ApplicationController.descendants.map(&:name)
  controllers = (controllers.map { |controller| controller[0..-11].downcase }).join("|")
  if models
    puts `bundle exec rails routes -g "#{models}|#{controllers}"`
  else
    puts `bundle exec rails routes -g "#{controllers}"`
  end
end
