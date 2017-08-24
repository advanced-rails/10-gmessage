require 'rails_helper'

RSpec.feature "Messages", type: :feature do
  context 'authenticated' do
    before(:each) do
      visit '/users/sign_in'
      fill_in 'user[email]', with: 'bob@aol.com'
      fill_in 'user[password]', with: 'pass1234'
      click_button 'Log in'
    end

    scenario 'send email to another user' do
      visit '/messages/new'
      fill_in 'message[email]', with: 'sue@aol.com'
      fill_in 'message[subject]', with: 'good morning'
      fill_in 'message[body]', with: 'have a good day'
      click_button 'Create Message'
      click_link 'Log Off'
      visit '/users/sign_in'
      fill_in 'user[email]', with: 'sue@aol.com'
      fill_in 'user[password]', with: 'pass1234'
      click_button 'Log in'
      visit '/messages'
      expect(page).to have_text('good morning')
    end
  end
end
