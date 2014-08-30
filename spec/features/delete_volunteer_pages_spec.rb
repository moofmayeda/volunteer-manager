require 'rails_helper'

describe "delete a volunteer" do
  before(:each) do
    visit '/sessions/new'
    organizer = Organizer.create(:name => 'michael', :password => 'password')
    fill_in 'Name', :with => 'michael'
    fill_in 'Password', :with => 'password'
    click_button 'Sign In'
    event1 = Event.create(:name => 'test1')
    event2 = Event.create(:name => 'test2')
    click_link 'Sign Out'
    visit '/volunteers/new'
    fill_in 'Name', :with => 'joseph'
    fill_in 'Phone', :with => '3233233232'
    fill_in 'Email', :with => 'joseph@michael.com'
    check('test2')
    click_button 'Create Volunteer'
  end

  it "successfully deletes a volunteer if an organizer is signed in" do
    visit '/sessions/new'
    fill_in 'Name', :with => 'michael'
    fill_in 'Password', :with => 'password'
    click_button 'Sign In'
    visit '/events'
    click_link 'joseph'
    click_link 'Delete Volunteer'
    expect(page).to have_no_content 'joseph'
  end

  it "does not show a delete option if an organizer is not signed in" do
    visit '/events'
    click_link 'joseph'
    expect(page).to have_no_content 'Delete Volunteer'
  end
end
