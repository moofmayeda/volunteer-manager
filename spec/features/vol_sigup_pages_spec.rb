require 'rails_helper'

describe "sign up a volunteer" do
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

  it "signs up a new volunteer and schedules them for an action" do
    expect(page).to have_content 'Location test2'
  end

  it "edits a volunteer's sign-ups" do
    check('test1')
    uncheck('test2')
    click_button 'Update Volunteer'
    expect(page).to have_content 'Location test1'
  end
end
