require 'test_helper'

class MessageControllerTest < ActionDispatch::IntegrationTest

  test "help command" do
    get helpdw_path
    assert_response :success
    assert_equal ({"response_type"=>"in_channel", "text"=>"The following options are...
      /roll
      /register
      /new_char <input character name, stats, and modifiers>
      /edit_char <input character name, stats, or modifiers>
      /register_character <character_name>
      /character <character_name>
      /characters <user_name>
      /roster
      /character_roster\n"}), JSON.parse(@response.body)
  end
end
