require_relative '../test_helper'

class UserCanEditASkill < FeatureTest
  def test_existing_skill_is_updated_with_new_information
    skill_inventory.create({ title: 'Original Title',
                         description: 'Original Description' })

    skill_id = skill_inventory.all.last.id

    visit "/skills/#{skill_id}/edit"

    fill_in 'skill[title]', with: 'Updated skill'
    fill_in 'skill[description]', with: 'Updated cool skill'
    click_button 'Submit'

    assert_equal "/skills/#{skill_id}", current_path
    within 'h1' do
      assert page.has_content? 'Updated skill'
    end
    within 'p' do
      assert page.has_content? 'Updated cool skill'
    end
  end
end
