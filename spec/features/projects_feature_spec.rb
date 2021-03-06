require 'rails_helper'

feature 'Projects' do

  before do
    visit root_path
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  context 'adding a project' do
    scenario 'should display a link to add a project' do
      visit projects_path
      expect(page).to have_link('Start a project')
      click_link('Start a project')
      expect(current_path).to eq new_project_path
    end
  end

  context 'creating a project' do
    scenario 'prompt user to fill out a form, then displays the new project' do
      visit new_project_path
      fill_in('Name', with: 'Songodoro')
      fill_in('Description', with: 'Music break')
      fill_in('Launch date', with: '01/12/2016')
      click_button('Create Project')
      expect(page).to have_content('Songodoro')
    end
  end
end
