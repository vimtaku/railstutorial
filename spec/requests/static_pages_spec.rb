require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all page" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end


  describe "Home page" do
    before { visit root_path }

    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it { should have_selector('h1', :text => 'Sample App') }
    it { should have_title("Ruby on Rails Tutorial Sample App") }
    it { should_not have_selector('title', text: '| Home') }
  end

  describe "Help page" do
    before { visit help_path }

    let(:heading)    { 'Help' }
    let(:page_title) { 'Ruby on Rails Tutorial Sample App | Help' }
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)    { 'About' }
    let(:page_title) { 'Ruby on Rails Tutorial Sample App | About' }
  end


  describe "Contact page" do
    before { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Ruby on Rails Tutorial Sample App | Contact' }
  end


  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    should have_title( full_title('About Us') )

    click_link "Help"
    should have_title( full_title('Help') )

    click_link "Contact"
    should have_title( full_title('Contact') )


    click_link "Home"
    click_link "Sign up now!"
    should have_title( full_title('Sign up') )

    click_link "sample app"
    should have_title( full_title('') )

  end

end
