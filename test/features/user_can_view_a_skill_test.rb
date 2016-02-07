require_relative '../test_helper'

class UserCanEditASkill < FeatureTest

  def test_existing_skill_can_be_viewed
    create_skill(1)
    skill_id = skill_inventory.all.last.id

    visit "/skills/#{skill_id}"

    within 'h1' do
      assert page.has_content? 'my skill 1'
    end

    within 'p' do
      assert page.has_content? 'cool skill 1'
    end
  end
end
