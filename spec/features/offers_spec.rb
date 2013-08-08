require 'spec_helper'

describe 'offers' do

  describe 'GET /' do
    it 'displays register link' do
      visit root_path
      page.should have_link('Kill a Queue')
    end
  end

  describe 'GET /users/new' do
    it 'displays the new user form', :js => true do
      visit root_path
      click_link('New User')
      page.should have_button('Create User')
    end
  end

  describe 'POST /users' do
    it 'creates a new user', :js => true do
      visit root_path
      click_link('New User')
      fill_in('Balance', :with => 50)
      fill_in('Email', :with => 'bob@gmail.com')
      fill_in('user_password', :with => 'a')
      fill_in('user_password_confirmation', :with => 'a')
      click_button('Create User')
      page.should_not have_button('Create User')
      expect(User.first.balance).to eq 50
    end
  end

  describe 'GET /session/new' do
    it 'displays the login form' do
      visit root_path
      click_link('Login')
      page.should have_text('Login')
    end
  end

  describe 'POST /session/new' do
    it 'creates a new session' do
      visit root_path
      click_link('Login')
      page.should have_text('Login')
      fill_in('email', :with => 'bob@gmail.com')
      fill_in('password', :with => 'a')
      click_button('Login')
      page.should have_link('New User')
    end
  end

  # describe 'POST /offer/new' do
  #   it 'creates a new offer', :js => true do
  #     visit root_path
  #     login
  #     click_link('Kill a Queue')
  #     page.should have_button('Create Offer')
  #     fill_in('name', :with => 'Hoyts')
  #     fill_in('address', :with => 'Broadway')
  #     fill_in('date', :with => Time.now)
  #     fill_in('price', :with => 50)
  #     click_button('Create Offer')
  #     page.should_not have_button('Create Offer')
  #     expect(Offer.first.price).to eq 50
  #   end
  # end

end

# def login
#   visit root_path
#   click_link('Login')
#   page.should have_text('Login')
#   fill_in('email', :with => 'bob@gmail.com')
#   fill_in('password', :with => 'a')
#   click_button('Login')
# end
