require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
also_reload('lib/**/*.rb')
require('./lib/band')
require('./lib/venue')
require('pg')
require('pry')

get('/') do
  erb(:index)
end

get('/venues') do
  @venues = Venue.all
  erb(:venues)
end

post('/venues') do
  venue_name = params.fetch("venue_name")
  Venue.create({:name => venue_name})
  @venues = Venue.all
  erb(:venues)
end

get('/venues/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  @bands = Band.all
  erb(:venue)
end

post('/venue/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  band_id = params.fetch("band_id")
  band_id.each do |individual_id|
    band = Band.find(individual_id)
    @venue.bands.push(band)
  end
  @bands = (Band.all).-(@venue.bands)
  erb(:venue)
end

delete('/venues/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  @venue.delete
  @venues = Venue.all
  erb(:venues)
end

get('/bands') do
  @bands = Band.all
  erb(:bands)
end

post('/bands') do
  band_name = params.fetch("band_name")
  Band.create({:name => band_name})
  @bands = Band.all
  erb(:bands)
end
