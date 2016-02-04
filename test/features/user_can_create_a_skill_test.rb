require_relative '../test_helper'

class UserCanCreateASkillTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_skill_created_with_valid_attributes
    visit '/'
    click_link 'New Skill'
    fill_in 'skill[title]', with: 'The Newest Skill'
    fill_in 'skill[description]', with: 'Omg cool new skill!'
    click_button 'Submit'

    assert_equal '/skills', current_path

    within '#skills' do
    assert page.has_content?('The Newest Skill')
    end
  end
end
