require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
  	get signup_path
  	assert_no_difference 'User.count' do 
  		post user_path params: { user: {name: "", 
  										email: "valid@emailaddress.com",
  										password:              "foodbar",
  										password_confirmation: "foobar" }}
   end
   follow_redirect!
   assert_template 'users/show'
  end
end
