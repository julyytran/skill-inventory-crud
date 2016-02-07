require_relative '../test_helper'

class UserCanDeleteASkill < FeatureTest

  def test_existing_skill_is_deleted_successfully
    create_skill(1)
    visit '/skills'

    assert page.has_content? 'my skill 1'

    click_button 'Delete'

    within '#skills' do
      refute page.has_content? 'my skill 1'
   end
 end
end
