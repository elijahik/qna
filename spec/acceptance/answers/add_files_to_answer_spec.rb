require 'acceptance_helper'

feature 'Add files to answer', %q{
  In order to better describe my answer
  As an authenticated user
  I want to be able to attach files
} do
  
  given(:user) { create(:user) }
  given(:question) { create(:question, user: user) }

  background do
    sign_in(user)
    visit question_path(question)
  end

  scenario 'Authenticated user adds file to own answer' do
    fill_in 'Your answer', with: 'My answer'
    attach_file 'File', "#{Rails.root}/spec/files/rails_helper.rb"
    click_on 'Create Answer'

    within '.answers' do
      expect(page).to have_link 'rails_helper.rb', href: '/uploads/attachment/file/1/rails_helper.rb'
    end
  end
end