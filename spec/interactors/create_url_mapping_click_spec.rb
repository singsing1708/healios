require 'rails_helper'

RSpec.describe CreateUrlMappingClick, type: :interactor do
  describe '#call' do
    let(:url_mapping) { FactoryBot.create(:url_mapping) }
    it "should create url mapping click" do
        outcome = CreateUrlMappingClick.run({url_mapping_id: url_mapping.id})
        expect(outcome.valid?).to be_truthy
        expect(outcome.result).to be_a UrlMappingClick
        expect(outcome.result.url_mapping).to eq url_mapping
    end

    it "should fail if url_mapping_id is nil" do
        outcome = CreateUrlMappingClick.run({url_mapping_id: nil})
        expect(outcome.valid?).to be_falsey
    end

    it "should incrase url_mapping.url_mapping_clicks_count" do
        expect(url_mapping.url_mapping_clicks_count).to eq 0
        outcome = CreateUrlMappingClick.run({url_mapping_id: url_mapping.id})
        url_mapping.reload
        expect(url_mapping.url_mapping_clicks_count).to eq 1
        outcome = CreateUrlMappingClick.run({url_mapping_id: url_mapping.id})
        url_mapping.reload
        expect(url_mapping.url_mapping_clicks_count).to eq 2
    end
  end

end
