require 'acceptance_helper'

feature 'Browse answers for question' do  
  given(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given!(:answers) { create_list(:answer, 3, question: question, user: user) }

  scenario 'User browse question with related answers' do
    visit question_path(question)
    
    expect(page).to have_content question.title
    expect(page).to have_content question.body
    answers.each do |a|
      expect(page).to have_content a.body
    end
  end
end