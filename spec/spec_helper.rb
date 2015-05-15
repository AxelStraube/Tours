ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'pg'
require 'sinatra/activerecord'
require 'band'
require 'venue'

RSpec.configure do |config|
  config.after(:each) do
    Band.all().each do |band|
      band.destroy()
    end
    Venue.all().each do |venue|
      venue.destroy()
    end
  end
end
