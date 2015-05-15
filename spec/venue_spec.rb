require('spec_helper')

describe(Venue) do
  it("lists the bands that have played at a specific venue") do
    venue = Venue.create({:name => "Slims"})
    band = Band.create({:name => "Animal Collective"})
    venue.bands.push(band)
    expect(venue.bands()).to(eq([band]))
  end

  it("validates the presence of name") do
    venue = Venue.new({:name => ""})
    expect(venue.save()).to(eq(false))
  end

  it("converts the name before save to have the first letter of each word be uppercase no matter how entered") do
    venue = Venue.create({:name => "bottom of the hill"})
    expect(venue.name()).to(eq("Bottom Of The Hill"))
  end
end
