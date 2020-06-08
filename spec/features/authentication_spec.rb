require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(name: 'User', email: 'user@mail.com')
  end

  it 'Should Signup' do
    visit new_user_path
    fill_in 'user[email]', with: 'newUser@mail.com'
    fill_in 'user[name]', with: 'User'
    click_button 'Create User'
    expect(page).to have_content('All Events')
    expect(page).to have_content('Create Event')
  end

  it 'Should Signin' do
    visit login_path
    fill_in 'session[email]', with: 'user@mail.com'
    click_button 'Sign In'
    expect(page).to have_content('List of Upcoming Events')
    expect(page).to have_content('List of Past Events')
    expect(page).to have_content('Log Out')
  end

  it 'Should Signout' do
    visit login_path
    fill_in 'session[email]', with: 'user@mail.com'
    click_button 'Sign In'
    click_on 'Log Out'
    expect(page).to have_content('Email')
    expect(page).to have_content('Log in')
    expect(page).to have_content('Sign Up')
  end
end
