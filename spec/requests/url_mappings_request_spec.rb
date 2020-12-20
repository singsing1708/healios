require 'rails_helper'

RSpec.describe "UrlMappingsController", type: :request do
  describe '#show' do

    it "should routes original_url and url_mapping_clicks_count will increase 1" do
        url_mapping = FactoryBot.create(:url_mapping)
        expect(url_mapping.url_mapping_clicks_count).to eq 0
        get "/#{url_mapping.hashed_path}"
        expect(response).to redirect_to(url_mapping.original_url)
        url_mapping.reload
        expect(url_mapping.url_mapping_clicks_count).to eq 1
    end

    it "should return to root_path if hashed_path is not found" do
        get "/this_path_does_not_exists"
        expect(response).to redirect_to(root_path)
    end
  end

end
