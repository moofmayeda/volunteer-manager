require 'rails_helper'

describe "the organizer signin process" do
  it "signs an organizer in who uses the right password" do
    visit '/sessions/new'
    organizer = Organizer.create(:name => 'michael', :password => 'password')
    fill_in 'Name', :with => 'michael'
    fill_in 'Password', :with => 'password'
    click_button 'Sign In'
    expect(page).to have_content 'Add Event'
  end

  it "gives a user an error who uses the wrong password" do
    visit '/sessions/new'
    organizer = Organizer.create(:name => 'michael', :password => 'password')
    fill_in 'Name', :with => 'michael'
    fill_in 'Password', :with => 'wrong'
    click_button 'Sign In'
    expect(page).to have_content 'invalid'
  end
end
