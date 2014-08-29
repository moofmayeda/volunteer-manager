require 'rails_helper'

describe "the organizer sign out process" do
  it "signs out organizer" do
    visit '/sessions/new'
    organizer = Organizer.create(:name => 'michael', :password => 'password')
    fill_in 'Name', :with => 'michael'
    fill_in 'Password', :with => 'password'
    click_button 'Sign In'
    visit '/volunteers'
    click_link 'Sign Out'
    expect(page).to have_content 'Organizer Sign-in'
  end
end
