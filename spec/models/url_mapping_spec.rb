# == Schema Information
#
# Table name: url_mappings
#
#  id           :bigint           not null, primary key
#  user_id      :bigint
#  original_url :string           not null
#  hashed_path  :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe UrlMapping, type: :model do

  describe "#FactoryBot" do
    it 'can have factory' do
      url_mapping = FactoryBot.create(:url_mapping)
      expect(url_mapping).to be_a UrlMapping
      expect(url_mapping.id).to be_truthy
    end
  end

  describe "#shorten_url" do
    it 'should correct display the shorten_url' do
      url_mapping = FactoryBot.create(:url_mapping)
      expect(url_mapping.shorten_url).to eq "http://localhost:3000/#{url_mapping.hashed_path}"
    end
  end

  describe "#create" do
    it 'should can get relcated user' do
      user = FactoryBot.create(:user)
      url_mapping = FactoryBot.create(
        :url_mapping,
        user: user,
      )
      expect(url_mapping.user).to eq user
    end
  end

end
