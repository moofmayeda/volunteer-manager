require 'rails_helper'

describe "creating a new event" do
  it "creates an event" do
    visit '/sessions/new'
    organizer = Organizer.create(:name => 'michael', :password => 'password')
    fill_in 'Name', :with => 'michael'
    fill_in 'Password', :with => 'password'
    click_button 'Sign In'
    visit '/events/new'
    fill_in 'Name', :with => 'phone bank'
    fill_in 'Date', :with => '2014-09-17'
    fill_in 'Location', :with => 'union HQ'
    click_button 'Create Event'
    expect(page).to have_content 'union HQ'
  end

  it "only allows organizers to create events" do
    visit '/events/new'
    expect(page).to have_content 'Not authorized'
  end
end
