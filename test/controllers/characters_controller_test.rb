require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest

  test "create a simple character" do
    post new_char_path, params: { user_name: "mattrice", text: "name: SimpleChar, strength: 10" }
    assert_response :success
    assert_equal ({"response_type"=>"in_channel", "text"=>"mattrice birthed a new character, SimpleChar, with the following stats:
    Strength: 10
    Dexterity: 0
    Constitution: 0
    Intelligence: 0
    Wisdom: 0
    Charisma: 0
    Weapon Modifier(s): 0
    Armor Modifier(s): 0"}), JSON.parse(@response.body)
  end

  test "create a full character" do
    post new_char_path, params: { user_name: "mattrice", text: "name: ComplexChar, strength: 16, dexterity: 15, constitution: 14, intelligence: 13, wisdom: 12, charisma: 11, weapon: 2, armor: 1" }
    assert_response :success
    assert_equal ({"response_type"=>"in_channel", "text"=>"mattrice birthed a new character, ComplexChar, with the following stats:
    Strength: 16
    Dexterity: 15
    Constitution: 14
    Intelligence: 13
    Wisdom: 12
    Charisma: 11
    Weapon Modifier(s): 2
    Armor Modifier(s): 1"}), JSON.parse(@response.body)
  end

end
