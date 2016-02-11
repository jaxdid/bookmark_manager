# require 'spec_helper'
# User Story 1
# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

feature "see links" do
  # before(:all) do
  #   require 'capybara/dsl'
  #   require 'selenium-webdriver'
  #   include Capybara::DSL
  #   Capybara.default_driver = :selenium
  # end

  scenario "see links on homepage" do
    Link.create(url: 'http://www.google.com', title: 'Google')
    visit '/'
    expect(page).to have_content 'Google'
  end
end
