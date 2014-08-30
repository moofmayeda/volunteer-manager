require 'rails_helper'

describe "updating an event" do
  it "updates an event" do
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
    fill_in 'Name', :with => 'phone bank pizza party'
    within(".edit-event") do
      click_on('Update Event')
    end
    expect(page).to have_content 'phone bank pizza party'
  end
end
