require('capybara/rspec')
require('spec_helper')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the path to viewing homepage', {:type => :feature}) do
  it('allows the user to access the database') do
    visit('/')
    expect(page).to have_content("Click a button above to see a list of venues or bands in your database!")
  end
end

describe('the path to adding a band', {:type => :feature}) do
  it('allows the user to add a band to the database') do
    visit('/')
    click_on('BANDS')
    fill_in('band_name', :with => "American Football")
    click_button('Add Band')
    expect(page).to have_content('American Football')
  end
end
