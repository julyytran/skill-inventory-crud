require_relative '../test_helper'

class UserCanEditASkillTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_existing_skill_can_be_viewed
    create_skill(1)
    visit '/skills/1'

    within 'h1' do
      assert page.has_content? 'my skill 1'
    end

    within 'p' do
      assert page.has_content? 'cool skill 1'
    end
  end
end
