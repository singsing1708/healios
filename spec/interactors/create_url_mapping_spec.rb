require 'rails_helper'

RSpec.describe CreateUrlMapping, type: :interactor do
  describe '#call' do
    let(:user) { FactoryBot.create(:user) }
    it "should create url mapping" do
        outcome = CreateUrlMapping.run({user_id: user.id, original_url: "example.com"})
        expect(outcome.valid?).to be_truthy
        expect(outcome.result).to be_a UrlMapping
        expect(outcome.result.user).to eq user
        expect(outcome.result.hashed_path).to be_truthy
        expect(outcome.result.original_url).to eq "http://example.com"
    end

    it "should failed if user_id is missing" do
        outcome = CreateUrlMapping.run({user_id: nil, original_url: "example.com"})
        expect(outcome.valid?).to be_falsey
    end

    it "should failed if original_url is missing" do
        outcome = CreateUrlMapping.run({user_id: user.id, original_url: nil})
        expect(outcome.valid?).to be_falsey
    end

  end
end
