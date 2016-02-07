require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def test_can_create_a_skill
    create_skill(1)
    skill = skill_inventory.all.first

    assert skill.id
    assert_equal 'my skill 1', skill.title
    assert_equal 'cool skill 1', skill.description
  end

  def test_can_return_all_skill
    create_skill(3)
    all = skill_inventory.all

    assert_equal 3, all.length
    all.each do |skill|
      assert_kind_of Skill, skill
    end
  end

  def test_can_find_specific_skill_from_id
    create_skill(3)
    skill_id = skill_inventory.all.last.id

    skill = skill_inventory.find(skill_id)

    assert_equal skill_id, skill.id
  end

  def test_can_update_a_specific_skill
    create_skill(2)

    new_data = {
      title: 'MY SKILL',
      description: 'COOL'
    }

    skill_id = skill_inventory.all.last.id
    skill = skill_inventory.find(skill_id)

    assert_equal 'my skill 2', skill.title
    assert_equal 'cool skill 2', skill.description

    skill_inventory.update(skill_id, new_data)
    updated_skill = skill_inventory.find(skill_id)

    assert_equal 'MY SKILL', updated_skill.title
    assert_equal 'COOL', updated_skill.description
  end

  def test_can_delete_a_skill
    create_skill(3)
    task_id = skill_inventory.all.last.id

    assert_equal 3, skill_inventory.all.count

    skill_inventory.delete(task_id)

    assert_equal 2, skill_inventory.all.count
  end
end
