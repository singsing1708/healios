require 'rails_helper'
require_relative '../support/controller_macros'

RSpec.describe UrlMappingsController, type: :controller do
  describe "#create" do
    it "should returns to index page and create a url_mapping" do
      user = FactoryBot.create(:user)
      sign_in user
      expect(user.url_mappings.count).to eq 0
      post :create, params: { url_mapping: {original_url: "example.com"} }
      expect(response).to redirect_to(root_path)
      expect(user.url_mappings.count).to eq 1
      expect(user.url_mappings.first.original_url).to eq "http://example.com"
    end

    it "return to sign_in if no current_user" do
      post :create, params: { url_mapping: {original_url: "example.com"} }
      expect(response).to redirect_to("http://test.host/users/sign_in")
    end
  end
end
