require('spec_helper')

describe(Band) do
  it("lists the venues a specific band has played at") do
    venue = Venue.create({:name => "Bottom of the Hill"})
    band = Band.create({:name => "Brand New"})
    band.venues.push(venue)
    expect(band.venues()).to(eq([venue]))
  end

  it("validates the presence of name") do
    band = Band.new({:name => ""})
    expect(band.save()).to(eq(false))
  end

  it("converts the name before save to have the first letter of each word be uppercase no matter how entered") do
    band = Band.create({:name => "yo la tengo"})
    expect(band.name()).to(eq("Yo La Tengo"))
  end
end
