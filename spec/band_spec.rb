require('spec_helper')

describe(Band) do
  it("lists the venues a specific band has played at") do
    venue = Venue.create({:name => "Bottom of the Hill"})
    band = Band.create({:name => "Brand New"})
    band.venues.push(venue)
    expect(band.venues()).to(eq([venue]))
  end
end
