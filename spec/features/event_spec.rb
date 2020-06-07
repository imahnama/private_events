require 'rails_helper'

RSpec.feature 'Events', type: :feature do
  before :each do
    @user = User.create(name: 'User', email: 'user@mail.com')
  end

  it 'Should create an event' do
    visit login_path
    fill_in 'session[email]', with: 'user@mail.com'
    click_button 'Sign In'
    expect(page).to have_content('List of Upcoming Events')
    expect(page).to have_content('List of Past Events')
    click_on 'Create Event'
    expect(page).to have_content('Location')
    fill_in 'event[name]', with: 'Birthday party'
    fill_in 'event[location]', with: 'my house'
    fill_in 'event[description]', with: 'house party'
    fill_in 'event[date]', with: '2020/01/23'
    click_button 'Create Event'
    expect(page).to have_content('Created by')
  end

  it 'Should show the event index page' do
    visit login_path
    fill_in 'session[email]', with: 'user@mail.com'
    click_button 'Sign In'
    click_on 'All Events'
    expect(page).to have_content('List of Upcoming Events')
    expect(page).to have_content('List of Past Events')
  end
end
