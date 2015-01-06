# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

require "giantbomb"

GiantBomb::Api.key(ENV["giantbomb_key"])