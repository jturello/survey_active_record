require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('root path',{:type => :feature}) do
  it('displays the homepage') do
    visit('/')
    expect(page).to have_content('Welcome to the Survey App')
  end

  it("doesn't display survey list if there aren't any") do
    visit('/')
    expect(page).not_to have_content('Here are your surveys')
  end

  it('displays a create a new survey link') do
    visit('/')
    expect(page).to have_content('create a new survey')
  end

  it('navigates to the new survey page') do
    visit('/')
    click_link('create a new survey')
    expect(page).to have_content('New Survey')
  end
end

describe('adding a new survey', {:type => :feature}) do
  it('displays a form and allows user to add survey') do
    visit('/surveys/new')
    fill_in('Survey title', :with => "Programming Languages")
    click_button('Add Survey')
    expect(page).to have_content('Here are your surveys')
  end

  it('display survey detail page when user clicks survey link') do
    visit('/surveys/new')
    fill_in('Survey title', :with => "Programming Languages")
    click_button('Add Survey')
    click_link('Programming Languages')
    expect(page).to have_css("h1", text: 'Programming Languages')
  end
end

describe('viewing a survey individual page', {:type => :feature}) do
  it('updates the name of the survey') do
    visit('/surveys/new')
    fill_in('Survey title', :with => "Programming Languages")
    click_button('Add Survey')
    click_link('Programming Languages')
    fill_in('New title:', :with => "Foreign Languages")
    click_button('Update')
    expect(page).to have_content("Foreign Languages")
  end

  it('deletes the survey') do
    visit('/surveys/new')
    fill_in('Survey title', :with => "Programming Languages")
    click_button('Add Survey')
    click_link('Programming Languages')
    click_button('Delete')
    expect(page).not_to have_content('Programming Languages')
  end

  it('adds a new question for a survey') do
    visit('/surveys/new')
    fill_in('Survey title', :with => "Programming Languages")
    click_button('Add Survey')
    click_link('Programming Languages')
    fill_in('Question Name', :with => "What's your favorite language?")
    click_button('Add Question')
    expect(page).to have_content('What\'s your favorite language?')
  end
end
