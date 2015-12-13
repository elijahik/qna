require 'rails_helper'

feature 'Edit answers' do

  given(:user) { create(:user) }
  given(:other_user) { create(:other_user) }
  given(:question) { create(:question, user: user) }
  given!(:answer) { create(:answer, question: question, user: user) }

  scenario  'Authenticated user trying to edit others answers' do
    sign_in(other_user)
    visit question_path(question)
    expect(page).to_not have_link 'Edit answer'
  end

  scenario  'Non-authenticated user trying to edit answers' do
    visit question_path(question)
    expect(page).to_not have_link 'Edit answer'
  end

  scenario  'Authenticated user edits own answers'
end