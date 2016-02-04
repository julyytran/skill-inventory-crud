require_relative '../test_helper'

class UserCanEditASkillTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_existing_skill_is_updated_with_new_information
    create_skill(1)
    visit '/skills/1/edit'

    fill_in 'skill[title]', with: 'Updated skill'
    fill_in 'skill[description]', with: 'Updated cool skill'
    click_button 'Submit'

    assert_equal '/skills/1', current_path
    within 'h1' do
      assert page.has_content? 'Updated skill'
    end
    within 'p' do
      assert page.has_content? 'Updated cool skill'
    end
  end
end
