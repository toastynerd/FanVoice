# require 'spec_helper'
# feature 'Facebook Auth' do
#   before do
#     OmniAuth.config.mock_auth[:facebook] = {
#       "extra" => {
#         "user_hash" => {
#           "uid" => '12345',
#           "email" => 'shenst1@gmail.com',
#           "name" => "Andrew Shenstone",
#           "image => "http://graph.facebook.com/1234567/picture?type=square"
#         }
#       }
#     }
#  end
#   it "signing in with Facebook" do
#     visit '/'
#     click_link 'sign_in_with_facebook'
#     page.should have_content("Signed in with Facebook successfully.")
#     page.should have_content("Signed in as A Twit (@twit)")
#   end
# end
