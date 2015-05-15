require('spec_helper')

describe(Venue) do
  it("lists the bands that have played at a specific venue") do
    venue = Venue.create({:name => "Slims"})
    band = Band.create({:name => "Animal Collective"})
    venue.bands.push(band)
    expect(venue.bands()).to(eq([band]))
  end
end
